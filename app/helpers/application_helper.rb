module ApplicationHelper

  def current_user
    @_current_user ||= session[:current_user_id] &&
      User.find_by(id: session[:current_user_id])
  end


  def display_profile_photo(user)
    if user == current_user
      if user.photo_attached?
        render partial: 'change', 
          locals: {profile_photo: image_tag(user.photo, class: 'w-100') }
      else
        render partial: 'change',
          locals: {profile_photo: image_tag("https://bulma.io/images/placeholders/96x96.png") }
      end
    end
  end

end
