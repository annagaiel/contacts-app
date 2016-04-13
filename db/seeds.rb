User.create!([
  {first_name: "Anna", last_name: "Nato", email: "anna@ym.com", phone_number: "123-456-7890"},
  {first_name: "Jen", last_name: "Tom", email: "jen@ym.com", phone_number: "888-456-7890"},
  {first_name: "Mark", last_name: "Uy", email: "mark@ym.com", phone_number: "500-456-7890"}
])

100.times do
  User.create!(
    {first_name: Faker::Name.name, last_name: Faker::Internet.user_name, email: Faker::Internet.email,
      phone_number: Faker::PhoneNumber.cell_phone}
      )
end
