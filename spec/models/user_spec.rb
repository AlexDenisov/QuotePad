require 'spec_helper'

describe User do
  it "Vote Up once should increment rating" do
    excerpt = FactoryGirl.create :excerpt
    user = FactoryGirl.create :user
    user.vote_up excerpt
    excerpt.rating.should be(1)
  end
  it "Vote Up twice should increment rating once" do
    excerpt = FactoryGirl.create :excerpt
    user = FactoryGirl.create :user
    user.vote_up excerpt
    user.vote_up excerpt
    excerpt.rating.should be(1)
  end
end
