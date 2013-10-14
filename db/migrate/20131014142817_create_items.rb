class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.integer :item_group_id
      t.integer :client_id
      t.string :brand
      t.string :product
      t.string :reference
      t.integer :buy_price
      t.integer :sell_price
      t.datetime :date_sold
      t.boolean :payment

      t.timestamps
    end
  end
end
