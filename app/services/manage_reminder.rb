class ManageReminder
  def initialize(contact:)
    @contact = contact
    @user = contact.user
    @meetups = contact.meetups.where("meetup_day < ?", Date.yesterday)
  end
end
