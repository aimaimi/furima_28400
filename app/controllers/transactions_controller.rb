class TransactionsController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
  end

  def new
    @orderitem = OrderItem.new
  end

  def create
    @orderitem = OrderItem.new(postal_code: transaction_params[:postal_code],prefecture_id: transaction_params[:prefecture_id],city: transaction_params[:city],address: transaction_params[:address],building: transaction_params[:building],phone_number: transaction_params[:phone_number],item_id: transaction_params[:item_id],user_id: current_user.id)
    if @orderitem.save
      pay_item
      return redirect_to root_path
    else
      render 'index'
    end
  end

  private
  def transaction_params
    params.permit(:token, :postal_code, :prefecture_id, :city, :address, :building, :phone_number, :item_id)
  end

  def pay_item
    Payjp.api_key = "sk_test_d5bf67e4686670183742b583"
    Payjp::Charge.create(
      amount: Item.find(params[:item_id]).price,
      card: transaction_params[:token],
      currency: 'jpy'
    )
  end
end
