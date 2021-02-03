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
      render user.followers
    end
  end
end
