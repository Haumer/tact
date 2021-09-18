class MeetupsController < ApplicationController
  before_action :find_meetup, only: [:destroy]

  def new
    @meetup = Meetup.new
  end

  def create
    @meetup = Meetup.new(meetup_params)
    @meetup.user = current_user


    if @meetup.save
      respond_to do |format|
        format.turbo_stream { render turbo_stream: turbo_stream.prepend("meetups_#{@meetup.meetup_day.to_date.to_s}", locals: { meetup: @meetup, id: @meetup.id }, partial: "meetups/meetup")}
      end
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
