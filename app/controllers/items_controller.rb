class ItemsController < ApplicationController
  before_action :redirect_index, except: [:index]

  def index
  end

  def new
  end

  private
  
  def item_params
    params.require(:item).permit(:image)
  end

  def redirect_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end
end
