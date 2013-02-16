class Admin::ItemsController < Admin::AdminController
  before_filter :require_admin_user

  def index
    @items = Item.by_position.paginate(:page => params[:page], :per_page => 10)
  end

  def show
    @item = Item.find(params[:id])
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(params[:item])
    if @item.save
      redirect_to [:admin, @item], :notice => "Successfully created Item."
    else
      flash.now[:alert] = "Some error trying to create item."
      render :action => 'new'
    end
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update_attributes(params[:item])
      redirect_to [:admin, @item], :notice  => "Successfully updated Item."
    else
      flash.now[:alert] = "Some error trying to update Item."
      render :action => 'edit'
    end
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to :admin_items, :notice => "Successfully destroyed Item."
  end

  def reorder
    params[:ids].each_with_index do |id, index|
      Item.update_all(["position=?", index], ["id=?", id])
    end
    render :json => { "status" => "ok" }
  end
end
