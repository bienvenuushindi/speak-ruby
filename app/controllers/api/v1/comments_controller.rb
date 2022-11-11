class Api::V1::CommentsController < ApplicationController
  def index
    @comments = Comment.where(post_id: read_post_id)
    render json: @comments
  end

  def create
    @comment = Comment.new(
      text: comment_params,
      author_id: current_user.id,
      post_id: read_post_id
    )

    if @comment.save
      render json: @comment, status: :created, location: @comment
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
  end

  private

  def read_post_id
    params[:post_id]
  end

  # Only allow a list of trusted parameters through.
  def comment_params
    params.require(:comment).permit(:text)
  end
end
