class Admin::AdminUsersController < Admin::AdminController
  before_filter :require_admin_user, :except => [:reset_password, :reset_password_submit]
  before_filter :load_admin_user, :only => [:show, :edit, :update, :destroy]

  def index
    @admin_users = AdminUser.by_recent
  end

  def show
  end

  def new
    @admin_user = AdminUser.new
  end

  def create
    @admin_user = AdminUser.new(params[:admin_user])
    if @admin_user.save
      redirect_to [:admin, @admin_user], :notice => t("controllers.admin_users.create.success")
    else
      flash.now[:alert] = t("controllers.admin_users.create.error")
      render :action => :new
    end
  end

  def edit
  end

  def update
    if @admin_user.update_attributes(params[:admin_user])
      redirect_to [:admin, @admin_user], :notice  => t("controllers.admin_users.update.success")
    else
      flash.now[:alert] = t("controllers.admin_users.update.error")
      render :action => :edit
    end
  end

  def destroy
    @admin_user.destroy
    redirect_to :admin_admin_users, :notice => t("controllers.admin_users.destroy.success")
  end

  def reset_password
    @admin_user = AdminUser.find_using_perishable_token!(params[:reset_password_code], 1.week)

    render :reset_password, :layout => "admin/admin_basic"
  end

  def reset_password_submit
    @admin_user = AdminUser.find_using_perishable_token!(params[:reset_password_code], 1.week)

    if @admin_user.update_attributes(params[:admin_user])
      AdminUserSession.create(@admin_user)
      flash[:notice] = t("controllers.admin_users.reset_password.success")
      redirect_back_or_default admin_root_path
    else
      flash.now[:alert] = t("controllers.admin_users.reset_password.error")
      render :reset_password, :layout => "admin/admin_basic"
    end
  end

private

  def load_admin_user
    @admin_user = AdminUser.find(params[:id])
  end
end
