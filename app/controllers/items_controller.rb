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

  def delete_item
    item = Item.find(params[:item_id])
    item.delete
    redirect_to clients_path(client_search: params[:client_search])
  end

  def sell
    item = Item.find(params[:item_id])
    item.sell
    redirect_to clients_path(client_search: params[:client_search])
  end

  def unsell
    item = Item.find(params[:item_id])
    item.unsell
    redirect_to clients_path(client_search: params[:client_search])
  end

  def mark_as_paid
    item = Item.find(params[:item_id])
    item.mark_as_paid(params[:payment_method])
    redirect_to clients_path(client_search: params[:client_search])
  end

  private

  def item_params
    params[:item].permit(:sell_price, :date_sold, :payment, :payment_type)
  end

end
