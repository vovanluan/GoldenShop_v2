class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :price
      t.references :user, index: true, foreign_key: true
      t.references :book, index: true, foreign_key: true
    end
  end
end
