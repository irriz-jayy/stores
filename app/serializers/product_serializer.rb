class ProductSerializer < ActiveModel::Serializer
  attributes :id, :name, :price,:image_url, :category_id
end
