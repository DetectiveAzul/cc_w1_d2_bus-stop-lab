require 'minitest/autorun'
require 'minitest/rg'
require_relative '../bus'
require_relative '../person'
require_relative '../bus_stop'

class BusTest < Minitest::Test
  def setup
    @bus = Bus.new(25,"Riccarton")

    @person1 = Person.new("Andris", 29)
    @person2 = Person.new("Jaime", 29)

    @bus_stop1 = BusStop.new("Caledonian Road")
    @bus_stop2 = BusStop.new("Orwell Place")
  end

  def test_bus_getters()
    assert_equal("Riccarton", @bus.destination)
    assert_equal(25, @bus.route_number)
  end

  def test_bus_setters()
   @bus.destination = "Ocean Terminal"
   assert_equal("Ocean Terminal", @bus.destination)
  end

  def test_count_passengers
    assert_equal(0, @bus.passengers.count)
  end

  def test_drive
    assert_equal("Brum brum", @bus.drive)
  end

  def test_pickup
    @bus.pickup(@person1, @person2)
    assert_equal(2, @bus.passengers.count)
  end

   def test_drop_off
     @bus.pickup(@person1, @person2)
     @bus.drop_off(@person1)
     assert_equal(1, @bus.passengers.count)
   end

   def test_empty
    @bus.pickup(@person1, @person2)
    @bus.empty
    assert_equal(0, @bus.passengers.count)
  end

  def test_bus_pick_up_from_stop
    @bus_stop1.add_person_to_queue(@person1, @person2)
    @bus.pick_up_from_stop(@bus_stop1)
    assert_equal(2,@bus.passengers.count)
    assert_equal(0,@bus_stop1.queue.count)
  end

end
