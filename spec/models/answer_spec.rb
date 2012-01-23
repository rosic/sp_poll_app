require 'active_model'
require File.expand_path('../../../app/models/answer', __FILE__)

describe Answer do
  describe "validates question and answer presence" do
    before { subject.valid? }

    specify { subject.should_not be_valid }
    specify { subject.errors.should include(:question_id) }
    specify { subject.errors.should include(:answer) }
  end
end
