class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    @post.dog_id = dog.id
     if@post.save
        redirect_to  post_path(current_user)
    else
      render 'new'
    end
  end

  def edit

  end

  def show
    post.find(params[:id])
  end

  def destroy

  end
  
  private

  def post_params
    params.require(:post).permit(:content, :image, :user_id, :dog_id)
  end
end
