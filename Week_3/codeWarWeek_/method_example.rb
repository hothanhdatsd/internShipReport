# frozen_string_literal: true

def method_example(str)
  complement = { 'A' => 'T', 'T' => 'A', 'C' => 'G', 'G' => 'C' }
  if str.chars.any? { |value| !complement.include?(value) } || str.empty?
    'Wrong DNA'
  else
    str.chars.map do |value|
      complement[value]
    end.join
  end
end

require 'test/unit'
# class Test::Unit
class TestMethodExample < Test::Unit::TestCase
  include Test::Unit::Assertions
  def test_non_empty_strings
    assert_equal('TTTT', method_example('AAAA'))
    assert_equal('Wrong DNA', method_example(''))
    assert_equal('Wrong DNA', method_example('FESRSADVADAAAA'))
    assert_equal('TAACG', method_example('ATTGC'))
    assert_equal('TTCC', method_example('AAGG'))
    assert_equal('GCGC', method_example('CGCG'))
    assert_equal('TAACG', method_example('ATTGC'))
    assert_equal('CATAGCTAGCTAGCTAGCTAATATAAAAGCTGCTCTAAATTTATATATATATATGCTCTCTTATGTCTATCTGTCTAAT',
                 method_example('GTATCGATCGATCGATCGATTATATTTTCGACGAGATTTAAATATATATATATACGAGAGAATACAGATAGACAGATTA'))
  end
end


include Test::Unit::Assertions
Test::Unit::Assertions.assert_equal(method_example("deltas"), "Wrong DNA")
Test::Unit::Assertions.assert_equal(method_example( "abcd"), "Wrong DNA")