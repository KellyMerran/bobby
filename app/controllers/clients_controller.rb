class ClientsController < ApplicationController

  def new
  end

  def create
  end

  def index
  end

  def terms
  	@client = Client.find(params[:client_id])
  end

  def terms_approval
  	client = Client.find(params[:client_id])
  	approve_terms(client)
  	redirect_to item_groups_path
  end

  private

  def approve_terms(client)
  	client.update_attributes(agree_to_terms: true)
  end

end
