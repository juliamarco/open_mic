
class OpenMic
  attr_reader :location,
              :date,
              :performers

  def initialize(information)
    @information = information
    @location = @information[:location]
    @date = @information[:date]
    @performers = []
  end

  def welcome(performer)
    @performers << performer
  end

  def all_performers_jokes
    @performers.map do |performer|
        performer.jokes
      end
  end

  def repeated_jokes?
    if all_performers_jokes.flatten.uniq != all_performers_jokes.flatten
      return true
    else
      return false
    end
  end


end
