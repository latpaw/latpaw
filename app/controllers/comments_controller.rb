class CommentsController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(params[:comment])
    redirect_to post_path(@post)
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    redirect_to post_path(@post)
  end
  
  def add_reply
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(:body=>params[:reply],:fromid=>params[:comment_id])
    redirect_to @post
  end
end
