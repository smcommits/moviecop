module ApplicationHelper

  def current_user
    @_current_user ||= session[:current_user_id] &&
      User.find_by(id: session[:current_user_id])
  end


  def display_profile_photo(user)
    if user == current_user
      current_user_photo
    else
      image_tag("https://bulma.io/images/placeholders/96x96.png")
    end
  end

  def display_cover_image(user) 
    if user == current_user
      if user.coverimage.attached?
        render partial: 'coverimage',
          locals: {url: url_for(user.coverimage)}
      else
        render partial: 'coverimage',
          locals: {url: '/assets/cover_place.png'}
      end
    end
  end

  def current_user_photo
    if current_user.photo_attached?
      render partial: 'users/change', 
        locals: {profile_photo: image_tag(current_user.photo, class: 'w-100') }
    else
      render partial: 'users/change',
        locals: {profile_photo: image_tag("https://bulma.io/images/placeholders/96x96.png") }
    end
  end

end
