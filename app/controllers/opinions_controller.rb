# frozen_string_literal: true

class OpinionsController < ApplicationController
  def new; end

  def create
    @opinion = current_user&.opinions&.new(opinion_params)
    if @opinion&.save
      flash[:success] = 'Opinion Submitted!'
      redirect_to user_path(current_user)
    end
  end

  def like
    @opinion = Opinion.find(params[:id])
    if @opinion.liked_by current_user
      respond_to do |format|
        format.html { redirect_to :back }
        format.js
      end
    end
  end

  def unlike
    @opinion = Opinion.find(params[:id])
    if @opinion.unliked_by current_user

      respond_to do |format|
        format.html { redirect_to :back }
        format.js
      end

    end
  end

  private

  def opinion_params
    params.require(:opinion).permit(:text)
  end
end
