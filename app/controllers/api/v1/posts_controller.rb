class Api::V1::PostsController < ApiController
  def index
    @posts = Post.where(user_id: read_user_id)
    render json: @posts
  end

  private

  def set_post
    @post = Post.find(read_post_id)
  end

  def read_user_id
    params[:user_id]
  end
end
