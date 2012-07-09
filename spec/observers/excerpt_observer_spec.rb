require 'spec_helper'

describe ExcerptObserver do
  subject { ExcerptObserver.instance }
  it "should call #after_create when new excerpt created" do
    excerpt = FactoryGirl.build :excerpt
    subject.should_receive(:after_create).with(excerpt)
    Excerpt.observers.enable :excerpt_observer do
      excerpt.save
    end
  end
end

