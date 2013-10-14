class ItemGroup < ActiveRecord::Base
  has_many :items
  belongs_to :client
  accepts_nested_attributes_for :client
  accepts_nested_attributes_for :items

end
