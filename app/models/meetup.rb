class Meetup < ApplicationRecord
  belongs_to :user
  belongs_to :contact

  after_create_commit { broadcast_prepend_to "meetups" }
  after_update_commit { broadcast_repalce_to "meetups" }
  after_destroy_commit { broadcast_remove_to "meetups" }
end
