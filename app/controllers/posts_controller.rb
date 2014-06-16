class PostsController < ApplicationController
 def index
  end

   def create
    @profile = Profile.find(params[:profile_id])
    @post = @profile.posts.create(post_params)
    redirect_to profile_path(@profile)
  end

  private
    def post_params
      params.require(:post).permit(:upload, :status)
    end
end
