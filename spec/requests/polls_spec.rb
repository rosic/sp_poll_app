require 'spec_helper'

describe "Polls" do
  describe "GET /polls/1" do
    let(:poll) do
      p = PollStorage.new
      p.find(1)
    end

    it "displays tasks" do
      visit poll_path(poll.id)
      page.should have_content("To live or not to live?")
    end

    describe "interactive form", :js => true do
      before do
        visit poll_path(poll.id)
        page.find("input[type=submit]")['disabled'].should == "true"

        choose 'Yes'
      end

      it "enables on selection", :js => true do
        page.find("input[type=submit]")['disabled'].should == "false"
      end

      it "disables on submit and success", :js => true do
        page.find("input[type=submit]").click

        page.driver.resynchronize do
          page.find("input")['disabled'].should == "true"
        end
      end
    end
  end
end
