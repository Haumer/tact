class RemindersController < ApplicationController
  before_action :find_reminder, only: [:destroy]

  def destroy
    @reminder.destroy
    redirect_back(fallback_location: timeline_index_path(user: current_user))
  end

  private

  def find_reminder
    @reminder =Reminder.find(params[:id])
  end
end
