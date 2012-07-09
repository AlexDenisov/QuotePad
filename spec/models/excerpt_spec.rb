require "spec_helper"

describe Excerpt do
  it { should belong_to :author }

  describe "should have correct author name" do
    before(:each) do
      @excerpt = FactoryGirl.create :excerpt
      @author = FactoryGirl.create :user
      @excerpt.author = @author
      @excerpt.save
    end
    it "with exist author" do
      author = @excerpt.author
      author.display_name == @excerpt.author_name
    end
    it "with removed author" do
      User.delete @excerpt.author.id
      @excerpt.author_name == "Anonymous"
    end
  end
    
end

