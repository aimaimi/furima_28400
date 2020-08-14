class ItemsController < ApplicationController
  before_action :redirect_index, except: [:index, :show]
  before_action :redirect_show, only: [:edit]

  def index
    @items = Item.all.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    if Item.find(params[:id]).update(item_params)
      redirect_to item_path
    else
      render 'edit'
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :price, :name, :explanation, :category_id, :status_id, :shipping_fee_id, :shipping_area_id, :days_until_shipping_id).merge(user_id: current_user.id)
  end

  def redirect_index
    redirect_to action: :index unless user_signed_in?
  end

  def redirect_show
    @item = Item.find(params[:id])
    if current_user.id != @item.user_id
      redirect_to action: :show
    end
  end
end
