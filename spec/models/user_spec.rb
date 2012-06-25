require 'spec_helper'

describe User do
  it do
    user = FactoryGirl.create :admin
    user.is_admin?.should be_true
  end
end
