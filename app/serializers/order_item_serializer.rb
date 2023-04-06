class OrderItemSerializer < ActiveModel::Serializer
  attributes :id, :quantity, :price, :order_id, :product_id
end
