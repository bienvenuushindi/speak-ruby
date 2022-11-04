class LikesController < ApplicationController
  def create
    like = Post.find(params[:post_id]).likes.new(author: current_user)
    if like.save
      flash[:success] = 'Like saved successfully'
    else
      # error message
      flash.now[:error] = 'Error: Like could not be saved'
    end
    redirect_back(fallback_location: users_path)
  end
end
