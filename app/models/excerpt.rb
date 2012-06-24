class Excerpt < ActiveRecord::Base
  attr_accessible :content, :rating
  validates :content, :presence => true, 
                     :uniqueness => true,
                     :length => { :in => 5...200}
  belongs_to :user

  def author_name
    return "Anonimous" if self.user.nil?
    self.user.email
  end
end
