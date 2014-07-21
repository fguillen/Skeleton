require "test_helper"

class Admin::AdminUsersControllerTest < ActionController::TestCase
  def setup
    setup_admin_user
  end

  def test_index
    admin_user_1 = FactoryGirl.create(:admin_user)
    admin_user_2 = FactoryGirl.create(:admin_user)

    get :index

    assert_template "admin/admin_users/index"
    assert_ids([admin_user_2, admin_user_1, @admin_user], assigns(:admin_users))
  end

  def test_show
    admin_user = FactoryGirl.create(:admin_user)

    get :show, :id => admin_user

    assert_template "admin/admin_users/show"
    assert_equal(admin_user, assigns(:admin_user))
  end

  def test_new
    get :new
    assert_template "admin/admin_users/new"
    assert_not_nil(assigns(:admin_user))
  end

  def test_create_invalid
    AdminUser.any_instance.stubs(:valid?).returns(false)

    post :create

    assert_template "new"
    assert_not_nil(flash[:alert])
  end

  def test_create_valid
    post(
      :create,
      :admin_user => {
        :name => "Admin Wadus",
        :email => "email@email.com",
        :password => "pass",
        :password_confirmation => "pass"
      }
    )

    admin_user = AdminUser.last
    assert_redirected_to [:admin, admin_user]

    assert_equal("Admin Wadus", admin_user.name)
    assert_equal("email@email.com", admin_user.email)
  end

  def test_edit
    admin_user = FactoryGirl.create(:admin_user)

    get :edit, :id => admin_user

    assert_template "edit"
    assert_equal(admin_user, assigns(:admin_user))
  end

  def test_update_invalid
    admin_user = FactoryGirl.create(:admin_user)
    AdminUser.any_instance.stubs(:valid?).returns(false)

    put :update, :id => admin_user

    assert_template "edit"
    assert_not_nil(flash[:alert])
  end

  def test_update_valid
    admin_user = FactoryGirl.create(:admin_user)

    put(
      :update,
      :id => admin_user,
      :admin_user => {
        :name => "Other Name"
      }
    )

    assert_redirected_to [:admin, admin_user]
    assert_not_nil(flash[:notice])

    admin_user.reload
    assert_equal("Other Name", admin_user.name)
  end

  def test_destroy
    admin_user = FactoryGirl.create(:admin_user)

    delete :destroy, :id => admin_user

    assert_redirected_to :admin_admin_users
    assert_not_nil(flash[:notice])

    assert !AdminUser.exists?(admin_user.id)
  end

  def test_reset_password
    admin_user = FactoryGirl.create(:admin_user)
    get(
      :reset_password,
      :reset_password_code => admin_user.perishable_token
    )

    assert_template "reset_password"
  end

  def test_reset_password_submit
    admin_user = FactoryGirl.create(:admin_user, :email => "email@email.com")

    put(
      :reset_password_submit,
      :reset_password_code => admin_user.perishable_token,
      :admin_user => {
        :password => "PASS",
        :password_confirmation => "PASS"
      }
    )

    assert_redirected_to admin_root_path
    assert_not_nil(flash[:notice])

    # assert_equal admin_user, AdminUserSession.new(:email => "email@email.com", :password => "PASS").record
  end
end
