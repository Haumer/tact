class Contact < ApplicationRecord
  belongs_to :user, dependent: :destroy
  has_many :meetups
end
