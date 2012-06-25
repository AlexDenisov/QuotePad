class Excerpt < ActiveRecord::Base
  paginates_per 10
  belongs_to :user
  attr_accessible :content, :rating
  validates :content, :presence => true, 
                     :uniqueness => true,
                     :length => { :in => 5...200}

  def author_name
    return "Anonimous" if self.user.nil?
    self.user.display_name
  end

end

