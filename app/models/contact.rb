class Contact < ApplicationRecord
  belongs_to :user, dependent: :destroy
  has_many :meetups
  has_many :reminders

  after_touch :create_reminder

  def create_reminder
    return unless contact_frequency

    upcoming_meetup = Meetup.where(user: self.user, meetup_day: Date.today..Date.today + contact_frequency.day).first
    Reminder.create(reminder_day: upcoming_meetup.meetup_day + contact_frequency.day, contact: self) if upcoming_meetup.present?
  end
end
