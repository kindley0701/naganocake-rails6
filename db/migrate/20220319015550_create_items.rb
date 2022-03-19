class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|

      t.integer :genre_id
      t.string :name
      t.string :caption
      t.integer :unit_price
      t.boolean :is_active, default: true

      t.timestamps
    end
  end
end
