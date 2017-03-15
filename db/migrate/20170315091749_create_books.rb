class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title
      t.string :description
      t.numbers :price

      t.timestamps null: false
    end
  end
end
