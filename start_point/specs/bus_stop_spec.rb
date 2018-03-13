require 'minitest/autorun'
require 'minitest/rg'
require_relative '../bus_stop'
require_relative '../person'


class BusStopTest < Minitest::Test
  def setup
    @bus_stop1 = BusStop.new("Caledonian Road")
    @bus_stop2 = BusStop.new("Orwell Place")

    @person1 = Person.new("Andris", 29)
    @person2 = Person.new("Jaime", 29)
  end

  def test_getters()
    assert_equal("Caledonian Road",@bus_stop1.name)
    assert_equal("Orwell Place", @bus_stop2.name)
  end

  def test_add_person_to_queue()
    @bus_stop1.add_person_to_queue(@person1, @person2)
    assert_equal(2,@bus_stop1.queue.count)
  end
end
