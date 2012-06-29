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


  scope :subscribers, where(:subscribed => true)

  attr_accessible :email, 
                  :password, 
                  :password_confirmation, 
                  :remember_me, 
                  :role_id, 
                  :nickname, 
                  :subscribed

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

  validates :role_id, :presence => true

  def is_admin?
    return self.role.name.eql? Role.admin.name unless self.role.nil?
    false
  end

  def display_name
    return self.nickname unless self.nickname.nil? or self.nickname.empty?
    self.email
  end

  def vote_up(excerpt)
    vote(self.liked, self.disliked, excerpt, 1)
  end

  def vote_down(excerpt)
    vote(self.disliked, self.liked, excerpt, -1)
  end

  private
  def vote(left_votes, right_votes, excerpt, increment)
    return false if left_votes.include? excerpt
    if right_votes.include? excerpt
      right_votes.delete excerpt
    else
      left_votes << excerpt
    end
    excerpt.increment(:rating, increment).save
    true
  end


end
