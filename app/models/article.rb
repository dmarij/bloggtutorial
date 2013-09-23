class Article < ActiveRecord::Base
  has_many :comments
  def num_of_comments
    self.comments.count
  end
end
