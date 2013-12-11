require 'will_paginate'

class ClientsController < ApplicationController

  PER_PAGE = 2

  def index
    if params[:client_search].blank?
      @clients = current_user.admin? ? @clients = Client.all.paginate(page: params[:page], per_page: PER_PAGE) : @clients = current_user.client
    else
      @search = params[:client_search]
      @clients = Client.search_customer(params[:client_search]).paginate(page: params[:page], per_page: PER_PAGE)
    end
    @clients = @clients
  end

  def new
  end

  def create
  end

  def edit
    @client = Client.find(params[:id])
  end
  
  def update
    client = Client.find(params[:id])
    client.update_attributes(client_params)
    redirect_to clients_path
  end

  def terms
  	@client = Client.find(params[:client_id])
  end

  def terms_approval
  	client = Client.find(params[:client_id])
  	approve_terms(client)
  	redirect_to item_groups_path
  end

  def delete_client
    client = Client.find(params[:client_id])
    client.item_groups.delete_all
    client.user.delete
    client.delete
    redirect_to clients_path
  end

  private

  def approve_terms(client)
  	client.update_attributes(agree_to_terms: true)
  end

  def client_params
    params[:client].permit(:last_name, :first_name, :email, :phone)
  end

end
