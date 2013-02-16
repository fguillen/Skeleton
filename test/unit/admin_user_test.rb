require "test_helper"

class AdminUserTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert FactoryGirl.create(:admin_user).valid?
  end
end
