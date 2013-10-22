class AddPaymentTypeToItem < ActiveRecord::Migration
  def change
  	add_column :items, :payment_type, :string
  end
end
