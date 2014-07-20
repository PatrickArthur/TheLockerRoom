class FriendshipsController < ApplicationController
  include ActionView::Helpers::TextHelper
  def create
    @profile = current_user.profile
    @friendship = @profile.friendships.build(:friend_id => params[:friend_id])

    if @friendship.save
      flash[:notice] = "Added friend."
      redirect_to root_url
    else
      flash[:notice] = "Unable to add friend."
      redirect_to root_url
    end
  end

  def destroy
    @profile = current_user.profile
    @friendship = @profile.friendships.find(params[:id])
    if @friendship.destroy
      flash[:notice] = "Removed friendship."
    else
      flash[:notice] = "Error"
    end
    redirect_to @profile
  end
end
