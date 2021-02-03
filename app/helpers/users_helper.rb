module UsersHelper

  def display_opinions(user)
    if user.opinions.empty?
      content_tag(:p, "User is opinionless", class: "text-secondary font-weight-bold text-center")
    else
      render user.opinions
    end
  end

  def display_followers(user)
    if user.followers.empty?
      content_tag(:p, "User has no followers", class: "text-secondary font-weight-bold text-center")
    else
      render partial: 'layouts/follows', collection: user.followers, as: :user
    end
  end

  def display_follow_button(user)
    return if user == current_user

    unless current_user.following?(user)
      return link_to "Follow", followings_path(id: user.id), method: :post, class: 'following-button btn btn-dark w-50 mb-3' 
    end

    link_to "Unfollow", followings_path(id: user.id), method: :delete, class: 'unfollow-button btn btn-dark w-50 mb-3'
  end
end
