class ItemGroup < ActiveRecord::Base
  include PgSearch
  
  pg_search_scope :search_customer, :associated_against => {
    :client => [:first_name, :last_name],
  }

  has_many :items
  belongs_to :client
  accepts_nested_attributes_for :client
  accepts_nested_attributes_for :items


  def all_sold?
    return true if self.items.select {|item| item.sold != true }.blank?
    return false
  end

end
