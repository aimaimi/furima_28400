class ItemsController < ApplicationController
  before_action :redirect_index, except: [:index, :show]

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
  end

  private

  def item_params
    params.require(:item).permit(:image, :price, :name, :explanation, :category_id, :status_id, :shipping_fee_id, :shipping_area_id, :days_until_shipping_id).merge(user_id: current_user.id)
  end

  def redirect_index
    redirect_to action: :index unless user_signed_in?
  end
end
