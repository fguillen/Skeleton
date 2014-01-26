require "test_helper"

class TestTest < ActiveSupport::TestCase
  def test_true
    assert true
  end

  def test_assert_ids
    o1 = OpenStruct.new(:id => 1)
    o2 = OpenStruct.new(:id => 1)
    assert_ids([o1], [o2])
  end
end
