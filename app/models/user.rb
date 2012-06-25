class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, 
         :registerable,
         :recoverable, 
         :rememberable, 
         :trackable, 
         :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, 
                  :password, 
                  :password_confirmation, 
                  :remember_me, 
                  :role_id, 
                  :nickname
  # attr_accessible :title, :body
  has_many :excerpts
  belongs_to :role
  paginates_per 5

  validates :role_id, :presence => true

  def is_admin?
    return self.role.name.eql? Role.admin.name unless self.role.nil?
    false
  end

  def display_name
    return self.nickname unless self.nickname.nil? or self.nickname.empty?
    self.email
  end
end
