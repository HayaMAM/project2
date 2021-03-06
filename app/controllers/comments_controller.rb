class CommentsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def show 
   @username = @comment.user.email.split("@")[0]
  end 

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      redirect_to @post
    else
      flash.now[:danger] = "error"
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    redirect_to post_path(@post)
  end

  private

  def comment_params
    params.require(:comment).permit(:commenter, :body)
  end
end
