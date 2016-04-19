class User < ActiveRecord::Base
  def self.all_marks
    User.where(first_name: "Mark")
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def friendly_created_at
    created_at.strftime("%A, %b %d")
  end

  def japan_number
    "+81 #{phone_number}"
  end
end
