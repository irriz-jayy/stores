class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :shipping_address
end
