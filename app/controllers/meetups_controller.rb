class MeetupsController < ApplicationController
  before_action :find_meetup, only: [:destroy]

  def new
    @meetup = Meetup.new
  end

  def create
    @meetup = Meetup.new(meetup_params)
    @meetup.user = current_user
    if @meetup.save
      redirect_back(fallback_location: timeline_index_path(user: current_user))
    else
      render :new
    end
  end

  def destroy
    @meetup.destroy
    redirect_back(fallback_location: timeline_index_path(user: current_user))
  end

  private

  def find_meetup
    @meetup = Meetup.find(params[:id])
  end

  def meetup_params
    params.require(:meetup).permit(:contact_id, :meetup_day)
  end
end
