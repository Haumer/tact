# Create default user
User.destroy_all

user = User.create(
    email: "alex@haum.com",
    password: '123456'
)

# Create default contacts
user.contacts.build(
    [
        {first_name: "Ben", last_name: "Baranger", contact_frequency: 1},
        {first_name: "Julio", last_name: "Quintana", contact_frequency: 1},
        {first_name: "Phelim", last_name: "Dunleavy", contact_frequency: 2}
    ]
).save
