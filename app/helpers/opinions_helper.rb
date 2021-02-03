module OpinionsHelper

  def opinionionator_photo(user)
    if user.photo_attached?
      image_tag(user.photo)
    else
      image_tag("https://bulma.io/images/placeholders/96x96.png")
    end
  end
end
