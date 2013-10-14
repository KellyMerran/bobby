class ItemGroupsController < ApplicationController
  
  def index
    @item_groups = ItemGroup.all
  end

  def new
  	@item_group = ItemGroup.new
  	@item_group.build_client
  	
  	respond_to do |format|
  	  format.html
  	  format.xml { render xml: @item_group }
  	end
  end

  def create
  	@client = Client.create(client_params)
  	@item_group = @client.item_groups.create(item_group_params)  	
  	redirect_to item_groups_path
  end

  def add_item
    respond_to do |format|
      format.js { 'add_item.js.erb' }
    end
  end

  private

  def client_params
  	params[:item_group][:client_attributes].permit(:first_name, :last_name, :email, :phone)
  end
  
  def item_group_params
  	params[:item_group][:item_group].permit(:begin_date, :end_date)
  end

end
