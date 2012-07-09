require "spec_helper"

describe Notifier do
  include EmailSpec::Helpers
  include EmailSpec::Matchers

  before(:each) do
    @recipient = FactoryGirl.create :user
    @author = FactoryGirl.build :user
    @author.email = FactoryGirl.generate :email
    # TODO: fix this
    @author.save
    @excerpt = FactoryGirl.create :excerpt
    @excerpt.author = @author
    @excerpt.save
  end

  describe "new_user" do
    let(:mail) { Notifier.new_user(@recipient.email, @recipient.password) }

    it "should sent new user email" do
      mail.should deliver_to @recipient.email
    end
    it "should have subject" do
      mail.should have_subject "Welcome to QuotePad"
    end
    it "should have user login" do
      mail.should have_body_text "#{@recipient.email}"
    end
    it "should have user password" do
      mail.should have_body_text "#{@recipient.password}"
    end
  end

  describe "new_excerpt" do
    let(:mail) {Notifier.new_excerpt(@recipient.id, @excerpt.id)}

    it "should sent new user email" do
      mail.should deliver_to @recipient.email
    end
    it "should have subject" do
      mail.should have_subject "New Excerpt on QuotePad"
    end
    it "should have author name" do
      mail.should have_body_text "#{@excerpt.author.display_name}"
    end
    it "should have excerpt content" do
      mail.should have_body_text "#{@excerpt.content}"
    end
  end

end
