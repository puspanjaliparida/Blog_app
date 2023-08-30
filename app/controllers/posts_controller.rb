class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_post, only: [:edit, :update, :destroy]

  def index
    @posts = Post.all
    @current_user = current_user
  end

  def show
    @post = Post.find(params[:id])
  end
  

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.new(post_params)
    if @post.save
      redirect_to @post, notice: 'Blog post was successfully created.'
    else
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
  end
  
  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to @post, notice: 'Post was successfully updated.'
    else
      render :edit
    end
  end
  
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path, notice: "Post deleted successfully."
  end
  
  private
  
  def post_params
    params.require(:post).permit(:title, :description, :image, :video)
  end
  def set_post
    @post = Post.find(params[:id])
  end
end