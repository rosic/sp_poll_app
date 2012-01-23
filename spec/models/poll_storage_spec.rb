require 'rails'
require File.expand_path('../../../app/models/poll', __FILE__)
require File.expand_path('../../../app/models/poll_storage', __FILE__)

describe PollStorage do
  subject { PollStorage.new File.expand_path('../../fixtures/polls.yml', __FILE__) }

  it "finds question by id" do
    p = subject.find(1)
    p.should_not be_nil

    p.question.should == "To live or not to live?"
  end

  it "finds question by string id" do
    p = subject.find("1")
    p.should_not be_nil
  end

  it "loads questions" do
    all = subject.all
    all.should have(2).items

    all.first.id.should == 1
    all.last.id.should == 2
  end

end
