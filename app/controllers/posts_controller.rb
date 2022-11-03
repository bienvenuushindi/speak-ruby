class PostsController < ApplicationController
  def index
    @user = User.find(params[:id])
  end

  def show
    @post = Post.find(params[:post_id])
  end

  def new
    current_user
    post = Post.new
    respond_to do |format|
      format.html { render :new, locals: { post: } }
    end
  end

  def create
    new_post = current_user.posts.new(post_params)
    if new_post.save
      flash[:success] = 'Post saved successfully'
      redirect_to user_posts_path
    else
      # error message
      flash.now[:error] = 'Error: Post could not be saved'
      # render new
      render :new, locals: { post: new_post }
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
