class EndUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  validates :email, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :last_name_kana, presence: true
  validates :first_name_kana, presence: true
  validates :phone_number, presence: true
  validates :address, presence: true
  validates :postal_code, presence: true 
  
  has_many :cart_items, dependent: :destroy
  has_many :orders
  has_many :addresses, dependent: :destroy
end
