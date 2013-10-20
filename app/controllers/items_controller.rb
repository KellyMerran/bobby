class ItemsController < ApplicationController
  before_filter :authenticate_user!
    
  def show
    @item = Item.find(params[:id])
    respond_to do |format| 
      format.js
    end
  end

  def update
    item = Item.find(params[:id])
    item.update_attributes(item_params)
    redirect_to clients_path
  end

  private

  def item_params
    params[:item].permit(:sell_price, :date_sold, :payment)
  end

end
