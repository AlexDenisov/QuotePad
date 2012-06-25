class Role < ActiveRecord::Base
  attr_accessible :name
  has_many :users

  def self.admin
    Role.find_or_create_by_name "Admin"
  end

  def self.user
    Role.find_or_create_by_name "User"
  end

end
