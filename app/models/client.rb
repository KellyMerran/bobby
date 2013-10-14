class Client < ActiveRecord::Base
  has_many :item_groups
  has_many :items

  def full_name
  	self.first_name + self.last_name
  end

end
