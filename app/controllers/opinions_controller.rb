class OpinionsController < ApplicationController
  def new

  end
  def create
    @opinion = current_user&.opinions&.new(opinion_params)
    if @opinion&.save
      flash[:success] = "Opinion Submitted!"
      redirect_to root_path
    end
  end


  private

  def opinion_params
    params.require(:opinion).permit(:text)
  end
end
