# Create default user
User.destroy_all

user = User.create(
    email: "alex@haum.com",
    password: '123456'
)

# Create default contacts
user.contacts.build(
    [
        {first_name: "Ben", last_name: "Baranger", contact_frequency: 14},
        {first_name: "Julio", last_name: "Quintana", contact_frequency: 7},
        {first_name: "Phelim", last_name: "Dunleavy", contact_frequency: 2},
        {first_name: "Richard", last_name: "Messmer", contact_frequency: 1},
        {first_name: "Frederik", last_name: "Fink", contact_frequency: 3}
    ]
)
user.save

# Create Random Meetups
Contact.all.each do |contact|
  rand(10).times do
    random_date = (Date.today..Date.today + 30.day).to_a.sample
    Meetup.create(user: user, contact: contact, meetup_day: random_date)
  end
end
