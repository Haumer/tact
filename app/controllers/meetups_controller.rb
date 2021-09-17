class MeetupsController < ApplicationController
  before_action :find_meetup, only: [:destroy]

  def destroy
    @meetup.destroy
    redirect_back(fallback_location: timeline_index_path(user: current_user))
  end

  private

  def find_meetup
    @meetup = Meetup.find(params[:id])
  end
end
