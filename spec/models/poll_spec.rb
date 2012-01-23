require File.expand_path('../../../app/models/poll', __FILE__)

describe Poll do

  it "has question text" do
    Poll.new(:id => 1, :question => "Go?", :answers => {}).question.should == "Go?"
  end

  it "has answers " do
    p = Poll.new(:id => 1, :question => '', :answers => { 1 => "Yes", 2 => "No", 3 => "Maybe" })

    p.answers.should have(3).items
    p.answers.first.should == [1, 'Yes']
  end


end
