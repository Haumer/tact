# frozen_string_literal: true

class Timeline::RemindersComponent < ViewComponent::Base
  def initialize(user:)
    @user = user
  end

  def reminders
    @user.reminders.where(reminder_day: Date.today..Date.today + 6.day)
  end

  def last_reminder_date(user)
    user.meetups.where(meetup_day: Date.today- 365.day..Date.today).first.meetup_day.strftime('%A, %b %d')
  end
end
