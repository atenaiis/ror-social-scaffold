module FriendshipsHelper
  def accept(user)
    current_user.confirm_friend(user)
  end
end
