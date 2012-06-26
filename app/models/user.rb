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

  has_many :votes

  has_many :user_excerpt_liked
  has_many :liked, 
           :through => :user_excerpt_liked, 
           :dependent => :destroy, 
           :source => :excerpt
  
  has_many :user_excerpt_disliked
  has_many :disliked, 
           :through => :user_excerpt_disliked, 
           :dependent => :destroy, 
           :source => :excerpt
  
  has_many :excerpts
  belongs_to :role
  paginates_per 5


#  scope :liked, votes.where(:positive => true)
#  scope :disliked, votes.where(:positive => false)

  validates :role_id, :presence => true

#  def liked
    #self.votes.where(:positive => true)
  #end
  #def disliked
    #self.votes.where(:positive => false)
  #end

  def is_admin?
    return self.role.name.eql? Role.admin.name unless self.role.nil?
    false
  end

  def display_name
    return self.nickname unless self.nickname.nil? or self.nickname.empty?
    self.email
  end

  def vote_up(excerpt)
    return false if self.liked.include? excerpt 
    if self.disliked.include? excerpt
      self.disliked.delete excerpt
    else
      self.liked << excerpt
    end
    excerpt.increment(:rating, 1).save
    true
  end

  def vote_down(excerpt)
    return false if self.disliked.include? excerpt 
    if self.liked.include? excerpt
      self.liked.delete excerpt
    else
      self.disliked << excerpt
    end
    excerpt.increment(:rating, -1).save
    true
  end

end
