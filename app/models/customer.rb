class Customer < ApplicationRecord

has_many :items
has_many :addresses
has_many :orders
has_many :cart_items
#has_manyは複数。

validates :last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number, presence: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  def full_name
    self.last_name + " " + self.first_name
  end
end
