class ChangeOrdersTable < ActiveRecord::Migration[5.0]
  def change
    change_column :orders, :deadline, :string
    change_column :orders, :time, :string
  end
end
