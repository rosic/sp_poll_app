require 'spec_helper'

describe PollsController do

  describe "GET 'show'" do
    it "returns http success" do
      get 'show', :id => 1
      assigns(:poll)
      assigns(:answer)
    end
  end

  describe "GET 'mark'" do
    it "renders error if invalid" do
      get 'mark'
      response.status.should == 500
    end

    it "renders nothing if valid" do
      get 'mark', :q => 1, :a => 1
      response.should be_success
    end
  end

end
