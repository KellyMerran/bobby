class ItemGroup < ActiveRecord::Base
  include PgSearch
  
  pg_search_scope :search_customer, :associated_against => {
    :client => [:first_name, :last_name],
  }

  has_many :items
  belongs_to :client
  accepts_nested_attributes_for :client
  accepts_nested_attributes_for :items

end
