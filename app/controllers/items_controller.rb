class ItemsController < ApplicationController
  before_filter :authenticate_user!
    
  def show
    @item = Item.find(params[:id])
    @search = params[:client_search] if params[:client_search]
    respond_to do |format| 
      format.js 
    end
  end

  def update
    item = Item.find(params[:id])
    item.update_attributes(item_params)
    redirect_to clients_path(client_search: params[:item][:client_search])
  end

  private

  def item_params
    params[:item].permit(:sell_price, :date_sold, :payment)
  end

end
