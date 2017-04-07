class ChangeOrderDateTime < ActiveRecord::Migration[5.0]
  def up
    change_column :orders, :deadline, :date, default: Time.now
    add_column :orders, :time, :time, default: "23:59:00"
  end

  def down
    change_column :orders, :deadline, :datetime
    remove_column :orders, :time
  end
end
