class Excerpt < ActiveRecord::Base
  paginates_per 10
  belongs_to :user

  has_many :user_excerpt_disliked
  has_many :opposers, 
           :through => :user_excerpt_disliked,
           :dependent => :destroy, 
           :source => :user
  
  has_many :user_excerpt_liked
  has_many :lovers, 
           :through => :user_excerpt_liked,
           :dependent => :destroy, 
           :source => :user
  
  attr_accessible :content, :rating
  validates :content, :presence => true, 
                     :uniqueness => true,
                     :length => { :in => 5...200}

  def author_name
    return "Anonimous" if self.user.nil?
    self.user.display_name
  end

end

