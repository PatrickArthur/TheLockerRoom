class PostsController < ApplicationController
  include ActionView::Helpers::TextHelper


  def index
    @posts = Post.all
    @profiles = Profile.all
  end



  def new
    @profile = current_user.profile
    @post = Post.new
  end


  def create
    @profile = current_user.profile
    @post = @profile.posts.build(post_params)

    if @post.save
      flash[:notice] = "Success!"
      redirect_to @profile
    else
      flash[:notice] = "Your status couldnt be saved."
      redirect_to @profile
    end
  end



  def upvote
    @post = Post.find(params[:id])
    @post.liked_by current_user
    redirect_to current_user.profile
  end

  def downvote
    @post = Post.find(params[:id])
    @post.downvote_from current_user
    redirect_to current_user.profile
  end



  private
    def post_params
      params.require(:post).permit(:status,:loadpic,:clip,:upvote,:downvote)
    end
end








