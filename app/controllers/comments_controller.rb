class CommentsController < ApplicationController
  include ActionView::Helpers::TextHelper


  def new
    @post = Post.find(params[:post_id])
    @comment = Comment.new
  end


  def create
    @profile = current_user.profile
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(comment_params)
    @comment.profile = current_user.profile


    if @comment.save
      flash[:notice] = "Success!"
      redirect_to @post.profile
    else
      flash[:notice] = "Your review couldnt be saved."
      redirect_to @post.profile
    end
  end



  def upvote
    @comment = Comment.find(params[:id])
    @comment.liked_by current_user
    redirect_to posts_path
  end

  def downvote
    @comment = Comment.find(params[:id])
    @comment.downvote_from current_user
    redirect_to posts_path
  end



  private
    def comment_params
      params.require(:comment).permit(:comment,:upvote,:downvote)
    end
end
