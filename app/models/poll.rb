class Poll
  attr_reader :id, :question, :answers

  def initialize(attrs = {})
    @id = attrs.fetch(:id)
    @question = attrs.fetch(:question)
    @answers = attrs.fetch(:answers)
  end


end
