class Contact < ApplicationRecord
  belongs_to :user, dependent: :destroy
  has_many :meetups
  has_many :reminders

  after_save :create_reminder

  def create_reminder
    return unless contact_frequency

    upcoming_meetup = Meetup.where(user: user, meetup_day: Date.today..Date.today + contact_frequency.day).first
    return Reminder.create(reminder_day: Date.today + contact_frequency.day, contact: self) unless upcoming_meetup.present?
  end
end
