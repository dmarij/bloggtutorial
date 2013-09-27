class AuthorSessionsController < ApplicationController
  def new
  end

  def create
    if login(params[:username], params[:password])
      redirect_to(:root, notice: 'Logged in successfully.')#, notice: 'Logged in successfully.'
    else
      flash.notice = "Login failed."
      render action: :new
    end
  end

  def destroy
    logout
    redirect_to(:authors, message: 'Logged out!')
  end
end