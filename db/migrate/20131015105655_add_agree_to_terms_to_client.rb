class AddAgreeToTermsToClient < ActiveRecord::Migration
  def change
  	add_column :clients, :agree_to_terms, :boolean
  end
end
