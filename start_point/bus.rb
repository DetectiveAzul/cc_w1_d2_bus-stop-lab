class Bus
  attr_accessor :route_number, :destination, :passengers
  def initialize(route_number, destination)
    @route_number = route_number
    @destination = destination
    @passengers = []
  end

  def drive
    return "Brum brum"
  end

  def pickup(*passenger)
    @passengers.concat(passenger)
  end

  def drop_off(*passenger)
    passenger.each do |pas|
      @passengers.delete(pas) if @passengers.include? pas
    end
  end

  def empty
    @passengers = []
  end

  def pick_up_from_stop(bus_stop)
    @passengers.concat(bus_stop.queue)
    bus_stop.queue = []
  end 
end
