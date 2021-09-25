class Meetup < ApplicationRecord
  belongs_to :user
  belongs_to :contact

  scope :future, -> { where("meetup_day > ?", Date.yesterday)}
  scope :future_for, -> (contact) { contact.meetups.where("meetup_day > ?", Date.yesterday)}

  after_create_commit { broadcast_prepend_to "meetups_#{self.meetup_day.to_date}" }
  after_update_commit { broadcast_replace_to "meetups" }
  after_destroy_commit { broadcast_remove_to "meetups" }
end
