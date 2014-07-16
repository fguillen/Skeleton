require "test_helper"

class AdminUserTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert FactoryGirl.create(:admin_user).valid?
  end

  def test_send_reset_password_email
    admin_user = FactoryGirl.create(:admin_user)
    old_perishable_token = admin_user.perishable_token

    mailer = mock
    mailer.expects(:deliver)
    Notifier.expects(:admin_user_reset_password).with(admin_user).returns(mailer)

    admin_user.send_reset_password_email

    assert_not_equal(old_perishable_token, admin_user.perishable_token)
  end

  def test_scope_by_recent
    admin_user_1 = FactoryGirl.create(:admin_user, :id => 1002)
    admin_user_2 = FactoryGirl.create(:admin_user, :id => 1003)
    admin_user_3 = FactoryGirl.create(:admin_user, :id => 1001)

    assert_ids([admin_user_2, admin_user_1, admin_user_3], AdminUser.by_recent)
  end
end
