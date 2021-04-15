class FriendshipsController < ApplicationController
  before_action :find_user, only: %i[update destroy]

  def create
    @friendship = current_user.sent_requests.build(friend_id: params[:friend_id])
    respond_to do |format|
      if @friendship.save

        format.html { redirect_to users_path, notice: 'Invite was successfully sent.' }
      else
        format.html { redirect_to users_path, alert: 'Invite was not sent.' }
      end
    end
  end

  def update
    respond_to do |format|
      if current_user.confirm_friend(@user)
        format.html { redirect_to users_path, notice: 'Friend request was accepted.' }
      else
        format.html { redirect_to users_path, alert: "Couldn't accept friend request." }
      end
    end
  end

  def destroy
    respond_to do |format|
      if current_user.delete_friend(@user)
        format.html { redirect_to users_path, notice: 'Friendship Successfully Deleted.' }
      else
        format.html { redirect_to users_path, alert: 'Friendship was rejected.' }
      end
    end
  end

  def find_user
    @user = User.find(params[:id])
  end
end

