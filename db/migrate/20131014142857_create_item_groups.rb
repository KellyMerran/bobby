class CreateItemGroups < ActiveRecord::Migration
  def change
    create_table :item_groups do |t|
      t.integer :client_id
      t.datetime :begin_date
      t.datetime :end_date

      t.timestamps
    end
  end
end
