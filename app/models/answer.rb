class Answer
  include ActiveModel::Validations
  extend ActiveModel::Naming
  include ActiveModel::Conversion


  attr_accessor :question_id, :answer

  validates_presence_of :question_id, :answer, :message => "should not be empty"

  def initialize(attributes = {})
    @attributes = attributes
    @question_id, @answer = attributes[:question_id], attributes[:answer]
  end

  def read_attribute_for_validation(key)
    @attributes[key]
  end

  def persisted?
    false
  end

end
