class ChangeOrdersTableDateFields < ActiveRecord::Migration[5.0]
  def change

    rename_column :orders, :deadline, :date
    change_column :orders, :date, 'date USING "date"::date'
    change_column :orders, :time, 'time USING "time"::time with time zone'
    add_column :orders, :deadline, :datetime

  end
end
