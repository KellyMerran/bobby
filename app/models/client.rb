class Client < ActiveRecord::Base
  has_many :item_groups
  has_many :items
  has_one :user

  after_save :create_user_account

  def full_name
  	self.first_name + ' ' + self.last_name
  end

  def create_user_account
  	User.create(:email => self.email, client_id: self.id)
  end

end
