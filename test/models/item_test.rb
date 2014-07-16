require "test_helper"

class ItemTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert FactoryGirl.create(:item).valid?
  end

  def test_on_create_initialize_position
    item_1 = FactoryGirl.create(:item, :position => 10)
    item_2 = FactoryGirl.create(:item)

    assert_equal(9, item_2.position)
  end

  def test_scope_by_position
    item_1 = FactoryGirl.create(:item, :position => 10)
    item_2 = FactoryGirl.create(:item, :position => 9)

    assert_ids([item_2, item_1], Item.by_position)
  end

  def test_scope_by_recent
    item_1 = FactoryGirl.create(:item, :id => 1002)
    item_2 = FactoryGirl.create(:item, :id => 1003)
    item_3 = FactoryGirl.create(:item, :id => 1001)

    assert_ids([item_2, item_1, item_3], Item.by_recent)
  end
end
