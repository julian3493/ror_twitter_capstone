module UsersHelper
  def follow_action(user)
    if current_user.users.include?(user)
      action = link_to('Unfollow', unfollow_user_path(user), method: :delete)
    elsif current_user == user
      action = ''
    else
      action = link_to('Follow', follow_user_path(user), method: :post)
    end
    return action
  end
end
