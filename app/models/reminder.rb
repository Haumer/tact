class Reminder < ApplicationRecord
  belongs_to :contact
  delegate :user, to: :contact, allow_nil: true
end
