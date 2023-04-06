class ShippingMethodSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :cost
end
