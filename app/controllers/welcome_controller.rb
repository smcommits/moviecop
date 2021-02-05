class WelcomeController < ApplicationController
  def index
    @opinion = Opinion.new
    @followings_opinions = current_user&.opinions_from_followings
    @not_followings = current_user&.not_following
  end
end
