# frozen_string_literal: true

class Contacts::CardComponent < ViewComponent::Base
  with_collection_parameter :contact
  attr_reader :contact

  def initialize(contact:)
    @contact = contact
  end
end
