module OpinionsHelper
  def opinionionator_photo(user)
    if user.photo_attached?
      image_tag(user.photo)
    else
      image_tag('https://bulma.io/images/placeholders/96x96.png')
    end
  end

  def display_like_button(opinion)
    opinion_liked_check(opinion)
  end

  def likes(opinion)
    votes = opinion.votes_for.by_type(User)
    return likers_collection(votes) if votes.size <= 4

    likers_count(votes)
  end

  def opinion_liked_check(opinion)
    if current_user.voted_for?(opinion)
      link_to unlike_opinion_path(opinion.id), remote: true do
        content_tag(:i, '', class: 'fas fa-heart like', id: "like_#{opinion.id}")
      end
    else
      link_to like_opinion_path(opinion.id), remote: true do
        content_tag(:i, '', class: 'far fa-heart like', id: "like_#{opinion.id}")
      end
    end
  end

  private

  def like_plural(votes)
    return ' like this' if votes.count > 1

    ' likes this'
  end

  def likers_collection(votes)
    user_names = []
    return if votes.blank?

    votes.voters.each do |voter|
      user_names.push(link_to(voter.username,
                              user_path(voter),
                              class: 'user-name text-secondary'))
    end
    user_names.to_sentence.html_safe.concat(like_plural(votes))
  end

  def likers_count(votes)
    vote_count = votes.size
    "#{vote_count} likes"
  end
end
