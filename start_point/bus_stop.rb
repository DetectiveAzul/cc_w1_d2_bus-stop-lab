class BusStop
  attr_reader :name
  attr_accessor :queue
  def initialize(name)
    @name = name
    @queue = []
  end

  def add_person_to_queue(*waiting_person)
    @queue.concat(waiting_person)
  end

end
