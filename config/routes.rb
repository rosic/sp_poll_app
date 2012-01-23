SpPollApp::Application.routes.draw do
  match "poll.gif", :to => "polls#mark"

  resources :polls, :only => [:show] do
    member do
      post :answer
    end
  end

end
