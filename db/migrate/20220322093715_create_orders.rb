class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|

      t.integer :customer_id
      t.string :zip
      t.string :address
      t.string :name
      t.integer :postage, default: 800
      t.integer :total
      t.integer :pay_method
      t.integer :status, default: 0

      t.timestamps
    end
  end
end
