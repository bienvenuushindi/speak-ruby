class LikesController < ApplicationController
  def create
    like = Post.find(params[:post_id]).likes.new(author: current_user)
    if like.save
      flash[:success] = 'Post saved successfully'
    else
      # error message
      flash.now[:error] = 'Error: Post could not be saved'
    end
    redirect_back(fallback_location: users_path)
  end
end
