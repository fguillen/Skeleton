class Admin::ItemsController < Admin::AdminController
  before_filter :require_admin_user
  before_filter :load_item, :only => [:show, :edit, :update, :destroy, :log_book_events]

  def index
    @items = Item.by_position.paginate(:page => params[:page], :per_page => 10)
  end

  def show
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(params[:item])
    @item.log_book_historian = current_admin_user
    if @item.save
      redirect_to [:admin, @item], :notice => t("controllers.items.create.success", :item_title => @item.title)
    else
      flash.now[:alert] = t("controllers.items.create.error")
      render :action => :new
    end
  end

  def edit
  end

  def update
    @item.log_book_historian = current_admin_user
    if @item.update_attributes(params[:item])
      redirect_to [:admin, @item], :notice  => t("controllers.items.update.success", :item_title => @item.title)
    else
      flash.now[:alert] = t("controllers.items.update.error")
      render :action => :edit
    end
  end

  def destroy
    @item.log_book_historian = current_admin_user
    @item.destroy
    redirect_to :admin_items, :notice => t("controllers.items.destroy.success", :item_title => @item.title)
  end

  def reorder
    params[:ids].each_with_index do |id, index|
      Item.find(id).update_attributes!(:position => index)
    end
    render :json => { "status" => "ok" }
  end

  def log_book_events
    @log_book_events = @item.log_book_events.by_recent.paginate(:page => params[:page], :per_page => 10)
  end

private

  def load_item
    @item = Item.find(params[:id])
  end
end
