class PollStorage

  def initialize(path = nil)
    @path = path || Rails.root.join('config/polls.yml')
  end

  def find(id)
    raise "ID required" unless id

    all_records.fetch(id.to_i)
  end

  def all
    all_records.values
  end

  private

  def all_records
    return @all if @all

    questions = YAML.load_file @path
    @all = {}
    questions.each do |question_attrs|
      @all[question_attrs[:id]] = Poll.new question_attrs
    end
    @all
  end

end
