require 'spec_helper'

describe UserObserver do
  subject { UserObserver.instance }
  it "should call #after_create when new user created" do
    user = FactoryGirl.build :user
    subject.should_receive(:after_create).with(user)

    User.observers.enable :user_observer do
      user.save
    end
  end
end

