class User < ApplicationRecord
    has_secure_password

    has_many :orders, dependent: :destroy
    has_many :order_items, through: :orders, dependent: :destroy

    validates :name, presence: true
    validates :email, presence: true
    validates :shipping_address, presence: true
end
