class OrderSerializer < ActiveModel::Serializer
  attributes :id, :status, :total, :user_id, :shipping_method_id
end
