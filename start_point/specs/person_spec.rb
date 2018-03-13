require 'minitest/autorun'
require 'minitest/rg'
require_relative '../person'

class PersonTest < Minitest::Test
  def setup
    @person1 = Person.new("Andris", 29)
    @person2 = Person.new("Jaime", 29)
  end

  def test_person_getters()
    assert_equal("Andris", @person1.name)
  end

  def test_person_setters()
    @person2.name = "Antonio"
    assert_equal("Antonio", @person2.name)
  end
end
