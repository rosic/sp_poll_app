class PollsController < ApplicationController

  def show
    @poll = storage.find params[:id]
    @answer = Answer.new :question_id => @poll.id
  end

  #def answer
    #@answer = Answer.new params[:answer]
    #if @answer.valid?
      #render :text => 'OK'
    #else
      #@poll = storage.find @answer.question_id
      #render :show
    #end
  #end

  def mark
    @answer = Answer.new(:question_id => params[:q], :answer => params[:a])
    if @answer.valid?
      render :nothing => true
    else
      render :nothing => true, :status => 500
    end
  end

  private

  def storage
    @storage ||= PollStorage.new
  end

end
