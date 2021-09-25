class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def self.find_class_name
    case self.model_name.name
    when "Reminder" then :reminder_day
    when "Meetup" then :meetup_day
    else
      :created_at
    end
  end

  scope :future, -> { where("#{self.find_class_name} > ?", Date.yesterday)}
  scope :future_for, -> (contact) { contact.meetups.where("#{self.find_class_name} > ?", Date.yesterday)}
  scope :with_range, -> (start_date, end_date) { where("#{self.find_class_name} BETWEEN ? AND ?", start_date, end_date)}
  scope :with_range_for, -> (contact, start_date, end_date) { contact.meetups.where("#{self.find_class_name} BETWEEN ? AND ?", start_date, end_date)}
end
