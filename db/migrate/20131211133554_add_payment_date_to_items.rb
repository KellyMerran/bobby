class AddPaymentDateToItems < ActiveRecord::Migration
  def change
  	add_column :items, :payment_date, :datetime
  end
end
