class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

  def index
    @posts = Post.all
    @subjects = Subject.all
  end

  def show
    @post = Post.find(params[:id])
    @username = @post.user.email.split("@")[0]
  end

  def new
    @post = Post.new
  end

  def edit
    @post = Post.find(params[:id])
  end

  def create
    post = current_user.posts.create(post_params)
    redirect_to posts_path
  end

  def update
    post = Post.find_by_id(params[:id])
    post.update(post_params)
    redirect_to post_path
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :text, :subject_ids => [])
  end
end
