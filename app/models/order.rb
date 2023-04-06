class Order < ApplicationRecord
    belongs_to :user
    belongs_to :shipping_method
    has_many :order_items, dependent: :destroy
    has_many :products, through: :order_items
end
