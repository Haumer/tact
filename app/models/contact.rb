class Contact < ApplicationRecord
  belongs_to :user, dependent: :destroy
end
