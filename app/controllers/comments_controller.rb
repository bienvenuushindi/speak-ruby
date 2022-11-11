class CommentsController < ApplicationController
  load_and_authorize_resource
  def new
    current_user
    comment = Comment.new
    respond_to do |format|
      format.html { render :new, locals: { comment: } }
    end
  end

  def create
    new_comment = Post.find(params[:post_id]).comments.new(text: comment_params[:text], author: current_user)
    if new_comment.save
      flash[:success] = 'Comment saved successfully'
      redirect_to single_post_path(params[:post_id])
    else
      flash.now[:error] = 'Error: Comment could not be saved'
      render :new, locals: { comment: new_comment }
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
