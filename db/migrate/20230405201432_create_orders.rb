class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.string :status
      t.integer :total
      t.references :user, foreign_key: true
      t.references :shipping_method, foreign_key: true
      
      t.timestamps
    end
  end
end