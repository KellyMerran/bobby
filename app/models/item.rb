class Item < ActiveRecord::Base
  belongs_to :item_group
  belongs_to :client

  def sold?
  	true if sell_price && date_sold
  end

end
