# frozen_string_literal: true

require 'test/unit'
require_relative 'position_sort_0211'
# class Test::Unit
class TestMethodExample < Test::Unit::TestCase
  include Test::Unit::Assertions
  def test_with_true_result
    assert_equal([{ id: 1, positions: %w[truongphong nhanviensale] },
                  { id: 2, positions: %w[tonggiamdoc truongphong nhanviensale] }],
                 check_position([{ id: 1, positions: %w[nhanviensale truongphong] },
                                 { id: 2, positions: %w[truongphong tonggiamdoc nhanviensale] }]))
    assert_equal([{ id: 2, positions: %w[tonggiamdoc giamdoc nhanviensale] },
                  { id: 1, positions: %w[nhanvienvp nhanviensale] }],
                 check_position([{ id: 1, positions: %w[nhanviensale nhanvienvp] },
                                 { id: 2, positions: %w[giamdoc tonggiamdoc nhanviensale] }]))
  end

  def test_with_non_input
    assert_equal(-1, check_position([]))
  end
end
