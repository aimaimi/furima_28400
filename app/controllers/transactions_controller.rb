class TransactionsController < ApplicationController
  before_action :redirect_login, only: [:index]
  before_action :redirect_top, only: [:index]

  def index
    @item = Item.find(params[:item_id])
  end

  def new
    @orderitem = OrderItem.new
  end

  def create
    @orderitem = OrderItem.new(postal_code: transaction_params[:postal_code], prefecture_id: transaction_params[:prefecture_id], city: transaction_params[:city], address: transaction_params[:address], building: transaction_params[:building], phone_number: transaction_params[:phone_number], item_id: transaction_params[:item_id], user_id: current_user.id)
    if @orderitem.save
      pay_item
      redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def transaction_params
    params.permit(:token, :postal_code, :prefecture_id, :city, :address, :building, :phone_number, :item_id)
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: Item.find(params[:item_id]).price,
      card: transaction_params[:token],
      currency: 'jpy'
    )
  end

  def redirect_login
    redirect_to new_user_session_path unless user_signed_in?
  end

  def redirect_top
    redirect_to '/' if current_user.id == Item.find(params[:item_id]).user_id
  end
end
