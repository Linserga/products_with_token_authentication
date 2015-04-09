class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.references :user, index: true
      t.string :name
      t.decimal :quantity
      t.string :price

      t.timestamps null: false
    end
    add_foreign_key :products, :users
  end
end
