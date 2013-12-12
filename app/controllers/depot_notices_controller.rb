class DepotNoticesController < ApplicationController
  
  def index
    # range = (Time.new(2013, 12, 05))..Time.now.midnight - 2.months
    range = (Time.now.midnight - 2.months)..Time.now
    @clients = Client.where(created_at: range).where(notified_depot_end: nil)
  end

  def create
    client = Client.find(params[:client_id])
    ClientNotifier.end_of_depot(client).deliver!
    client.update_attributes(notified_depot_end: true)
    redirect_to :back
  end

end