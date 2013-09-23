class Article < ActiveRecord::Base
  has_many :comments
  has_many :taggings
  has_many :tags, through: :taggings
  def num_of_comments
    self.comments.count
  end
  def tag_list
    self.tags.join(", ")
  end
  def tag_list=(tags_string)
    tag_names = tags_string.split(",").collect{|s| s.strip.downcase}.uniq
    self.tags = tag_names.collect { |tag_name| Tag.find_or_create_by(name: tag_name) }
  end
end
