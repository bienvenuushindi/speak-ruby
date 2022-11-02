class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def show_posts_comments
    @user = User.find(params[:id])

    render template: 'users/show', locals: { comments: true }
  end
end
