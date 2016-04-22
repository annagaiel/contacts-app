namespace :address do
  desc "Add random address"
  task populate_address: :environment do
    users = User.all
    users.each do |user|
      user.update_attribute(:address, '1451 Balhan drive apt. 103')
    end
  end

end
