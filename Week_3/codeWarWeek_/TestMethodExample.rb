# frozen_string_literal: true

require 'test/unit'
require_relative 'genarate_string_from_number_0111'
# class Test::Unit
class TestMethodExample < Test::Unit::TestCase
  include Test::Unit::Assertions
  def test_non_empty_strings
    assert_equal(3, generate_number(3, 3).size)
    assert_equal(1, generate_number(1, 2).size)
    assert_equal(1, generate_number(1, 3).size)
    assert_equal(1, generate_number(1, 2).size)
    assert_equal(1, generate_number(1, 3).size)
    assert_equal(2, generate_number(2, 2).size)
    assert_equal(3, generate_number(3, 2).size)
    assert_equal(3, generate_number(3, 3).size)
  end
end
