require "test_helper"

class Front::ItemsControllerTest < ActionController::TestCase
  def test_index
    item_1 = FactoryGirl.create(:item)
    item_2 = FactoryGirl.create(:item)

    get :index

    assert :success
    assert_template "front/items/index"
    assert_equal([item_2, item_1].ids, assigns(:items).ids)
  end

  def test_show
    item = FactoryGirl.create(:item)

    get :show, :id => item

    assert :success
    assert_template "front/items/show"
    assert_equal(item, assigns(:item))
  end
end
