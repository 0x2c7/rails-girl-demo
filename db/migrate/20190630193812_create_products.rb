class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.text :name
      t.text :brand
      t.integer :price
      t.text :image

      t.timestamps
    end
  end
end
