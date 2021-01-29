module UsersHelper
  def follow_action(user)
    if current_user.users.include?(user)
      link_to('Unfollow', unfollow_user_path(user), method: :delete)
    elsif current_user == user
      ''
    else
      link_to('Follow', follow_user_path(user), method: :post)
    end
  end
end
