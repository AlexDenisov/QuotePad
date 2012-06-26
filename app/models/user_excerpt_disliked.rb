class UserExcerptDisliked < ActiveRecord::Base
  attr_accessible :excerpt_id, :user_id
  belongs_to :user
  belongs_to :excerpt
end
