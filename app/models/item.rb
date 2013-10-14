class Item < ActiveRecord::Base
  belongs_to :item_group
  belongs_to :client

end
