class CreateShippingMethods < ActiveRecord::Migration[7.0]
  def change
    create_table :shipping_methods do |t|
      t.string :name
      t.text :description
      t.integer :cost

      t.timestamps
    end
  end
end