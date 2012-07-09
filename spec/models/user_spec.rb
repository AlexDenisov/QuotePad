require 'spec_helper'

describe User do
  it { should have_many :excerpts }
  it { should belong_to :role }
  it { should validate_presence_of :role_id }
  describe "should have correct display_name" do
    before(:each) do
      @email = "fuu@bar.baz"
      @user = FactoryGirl.create :user, :email => @email
    end
    it "without nickname" do
      @user.nickname = nil
      @user.display_name == @email
    end
    it "within nickname" do
      nickname = "alexd"
      @user.nickname = nickname
      @user.display_name == nickname
    end
    it "within empty nickname" do
      nickname = ""
      @user.display_name == @email
    end
    
  end
end


