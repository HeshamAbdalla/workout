class FriendshipsController < ApplicationController
  before_action :authenticate_user!

  def show
    @friend = Friendship.find(params[:id]).friend
    @exercises = @friend.exercises.all
  end

  def create
    friend = User.find(params[:friend_id])
    Friendship.create(friendship_params.merge!(friend_id: params[:friend_id],
        user_id: current_user.id)) unless current_user.follows_or_same?(friend)
        redirect_to root_path
  end

  def destroy
  end

  private

  def friendship_params
    params.permit(:friend_id, :user_id)
  end
end
