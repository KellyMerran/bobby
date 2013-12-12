class AddNotifiedDepotEndToClients < ActiveRecord::Migration
  def change
    add_column :clients, :notified_depot_end, :boolean
  end
end
