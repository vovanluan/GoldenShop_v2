class ChangeColumnName < ActiveRecord::Migration
  def change
    rename_column :orders, :price, :quantity
  end
end
