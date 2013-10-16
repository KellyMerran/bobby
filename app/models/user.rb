class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :item_groups
  has_many :items
  belongs_to :client

  before_validation :set_generic_password

  def password_required?
    false
  end 

  def set_generic_password
  	self.password = 'password'
  end

  def admin?
    role == 'admin'
  end
  
end
