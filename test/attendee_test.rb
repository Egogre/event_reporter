require 'minitest'
require 'minitest/autorun'
require './attendee'

class AttendeeTest < MiniTest::Test

  # def test_it_exists
  #   attendee = Attendee.new
  #   assert_kind_of Attendee, attendee
  # end

  def test_it_is_initialized_from_a_hash_of_data
    data = {:first_name => 'George', :last_name => 'Washington', :phone_number => '2024556677'}
    attendee = Attendee.new(data)
      assert_equal data[:first_name], attendee.first_name
      assert_equal data[:last_name], attendee.last_name
      assert_equal data[:phone_number], attendee.phone_number
  end

  def test_it_can_change_first_names
    data = {:first_name => "George"}
    attendee = Attendee.new(data)
    assert_equal data[:first_name], attendee.first_name
    attendee.first_name = "Thomas"
    assert_equal "Thomas", attendee.first_name
  end

  def test_it_can_change_last_names
    data = {:last_name => "Washington"}
    attendee = Attendee.new(data)
    assert_equal data[:last_name], attendee.last_name
    attendee.last_name = "Winterling"
    assert_equal "Winterling", attendee.last_name
  end

  def test_it_can_change_phone_numbers
    data = {:phone_number => "3035551212"}
    attendee = Attendee.new(data)
    assert_equal data[:phone_number], attendee.phone_number
    attendee.phone_number = "3106665959"
    assert_equal "3106665959", attendee.phone_number
  end

  def test_it_cleans_phone_numbers_with_periods_and_hyphens
    attendee = Attendee.new(:phone_number => "(202).4 44-9999")
    assert_equal "2024449999", attendee.phone_number
  end

  def test_it_removes_leading_one_from_an_eleven_digit_phone_number
    attendee = Attendee.new(:phone_number => "1(202)444.9382")
    assert_equal "2024449382", attendee.phone_number
  end

  def test_it_throws_away_phone_numbers_that_are_too_long
    attendee = Attendee.new(:phone_number => "23334445555")
    assert_equal "0000000000", attendee.phone_number
  end

  def test_it_throws_away_phone_numbers_that_are_too_short
    attendee = Attendee.new(:phone_number => "222333444")
    assert_equal "0000000000", attendee.phone_number
  end

end