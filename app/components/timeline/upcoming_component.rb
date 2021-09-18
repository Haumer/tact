# frozen_string_literal: true

class Timeline::UpcomingComponent < ViewComponent::Base
  attr_reader :contacts, :user

  include Turbo::StreamsHelper
  include Turbo::FramesHelper

  def initialize(contacts:, user:)
    @contacts = contacts
    @user = user
  end

  def upcoming_meetups
    @user.meetups.where(meetup_day: Date.today..Date.today + 6.day)
  end

  def upcoming_reminders
    @user.reminders.where(reminder_day: Date.today..Date.today + 6.day)
  end

  def upcoming_contacts
    upcoming_meetups.map { |meetup | meetup.contact }.uniq
  end
end
