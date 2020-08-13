class ItemsController < ApplicationController
  before_action :redirect_index, except: [:index]

  def index
    @items = Item.all
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

  private

  def item_params
    params.require(:item).permit(:image, :price, :name, :explanation, :category_id, :status_id, :shipping_fee_id, :shipping_area_id, :days_until_shipping_id).merge(user_id: current_user.id)
  end

  def redirect_index
    redirect_to action: :index unless user_signed_in?
  end
end
