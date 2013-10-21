class Client < ActiveRecord::Base
  include PgSearch
  
  has_many :item_groups
  has_many :items
  has_one :user
  
  # pg_search_scope :search_customer, :against => [:first_name, :last_name]

  pg_search_scope :search_customer, associated_against: {
    items: [:reference] 
  }

  after_save :create_user_account

  def full_name
  	self.first_name + ' ' + self.last_name
  end

  def create_user_account
  	User.create(:email => self.email, client_id: self.id)
  end

  def number_of_groups
    self.item_groups.count.to_s
  end

end
