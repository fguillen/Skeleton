class Admin::AdminUserSessionsController < Admin::AdminController
  layout "admin/admin_basic"

  def new
    @admin_user_session = AdminUserSession.new
  end

  def create
    @admin_user_session = AdminUserSession.new(params[:admin_user_session])

    if @admin_user_session.save
      flash[:notice] = t("controllers.admin_user_sessions.authenticate.success")
      redirect_back_or_default admin_root_path
    else
      flash[:alert] = t("controllers.admin_user_sessions.authenticate.error")
      render :action => :new
    end
  end

  def destroy
    @admin_user_session = AdminUserSession.find
    @admin_user_session.destroy if @admin_user_session

    redirect_to admin_login_path, :notice => t("controllers.admin_user_sessions.logout.success")
  end

  def forgot_password
    @admin_user_session = AdminUserSession.new
  end

  def forgot_password_submit
    admin_user = AdminUser.find_by_email(params[:admin_user_session][:email])

    if admin_user
      admin_user.send_reset_password_email
      redirect_to admin_forgot_password_path, :notice => t("controllers.admin_user_sessions.reset_password.success")
    else
      redirect_to admin_forgot_password_path, :alert => t("controllers.admin_user_sessions.reset_password.error", :email => params[:admin_user_session][:email])
    end
  end
end