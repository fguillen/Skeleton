class Front::ItemsController < Front::FrontController
  def index
    @items = Item.by_position.paginate(:page => params[:page], :per_page => 10)
  end

  def show
    @item = Item.find(params[:id])
  end
end
