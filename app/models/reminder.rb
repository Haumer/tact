class Reminder < ApplicationRecord
  belongs_to :contact
  delegate :user, to: :contact, allow_nil: true

  after_create_commit { broadcast_prepend_to "reminders_#{self.reminder_day.to_date}" }
  after_destroy_commit { broadcast_remove_to "reminders" }
  after_update_commit { broadcast_replace_to "reminders" }
end
