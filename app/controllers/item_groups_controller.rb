class ItemGroupsController < ApplicationController
  before_filter :authenticate_user!
    
  def index    
    if params[:client_search].blank?
      @item_groups = current_user.admin? ? @item_groups = ItemGroup.all : @item_groups = current_user.client.item_groups
    else
      @item_groups = ItemGroup.search_customer(params[:client_search])
    end
  end

  def new
  	@item_group = ItemGroup.new
  	@item_group.build_client
  	
  	respond_to do |format|
  	  format.html
  	  format.xml { render xml: @item_group }
  	end
  end

  def add_group_only
    @client = Client.find(params[:client_id])
    @item_group = ItemGroup.new
  end

  def create
    if params[:item_group][:client_id]
      @client = Client.find(params[:item_group][:client_id]) 
    else
      @client = Client.create(client_params)
    end
  	@item_group = @client.item_groups.create(item_group_params)  	
    params[:item_group][:items].each do |k, v|
      @item_group.items.create(item_params(k).merge(client_id: @client.id))
    end
    redirect_to clients_path
  end

  def add_item
    respond_to do |format|
      format.js { 'add_item.js.erb' }
    end
  end

  def delete_item_group
    item = ItemGroup.find(params[:id])
    item.delete
    redirect_to clients_path
  end

  private

  def client_params
  	params[:item_group][:client_attributes].permit(:first_name, :last_name, :email, :phone)
  end
  
  def item_group_params
  	params[:item_group][:item_group].permit(:begin_date, :end_date)
  end

  def item_params(key)
    params[:item_group][:items][key].permit(:brand, :product, :reference, :buy_price, :sell_price)
  end

end
