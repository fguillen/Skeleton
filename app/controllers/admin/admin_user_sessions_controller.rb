class Admin::AdminUserSessionsController < Admin::AdminController
  layout "admin/admin_basic"

  def new
    @admin_user_session = AdminUserSession.new
  end

  def create
    @admin_user_session = AdminUserSession.new(params[:admin_user_session])

    if @admin_user_session.save
      flash[:notice] = "Admin User authenticated!"
      redirect_back_or_default admin_root_path
    else
      flash[:alert] = "Not possible to authenticate"
      render action: "new"
    end
  end

  def destroy
    @admin_user_session = AdminUserSession.find
    @admin_user_session.destroy if @admin_user_session

    redirect_to admin_login_path, :notice => "Admin User logged out!"
  end

  def reset_password
    @admin_user = AdminUser.find_using_perishable_token!(params[:reset_password_code], 1.week)
  end

  def reset_password_submit
    @admin_user = AdminUser.find_using_perishable_token!(params[:reset_password_code], 1.week)

    if @admin_user.update_attributes(params[:admin_user])
      AdminUserSession.create(@admin_user)
      redirect_to [:admin, @admin_user], :notice => "Password reseted!"
    else
      flash.now[:alert] = "Some errors trying to reset the password"
      render :reset_password
    end
  end

end