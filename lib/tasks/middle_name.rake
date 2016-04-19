namespace :middle_name do
  desc "Add random middle_names"
  task populate_middle_name: :environment do
    users = User.all
    users.each do |user|
      user.update_attribute(:middle_name, Faker::Name.last_name)
    end
  end

end
