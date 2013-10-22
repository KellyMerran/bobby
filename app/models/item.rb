class Item < ActiveRecord::Base
  belongs_to :item_group
  belongs_to :client

  def sell
  	self.update_attributes(sold: true, date_sold: Time.now)
  end

  def unsell
  	self.update_attributes(sold: false, date_sold: nil)
  end

  def sold_and_unpaid
  	self.sold? && !self.payment
  end

  def sold_and_paid
  	self.sold? && self.payment
  end

  def mark_as_paid(method)
  	self.update_attributes(payment: true, payment_type: method)
  end

end
