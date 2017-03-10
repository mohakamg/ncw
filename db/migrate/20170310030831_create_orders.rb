class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.integer :student_id
      t.integer :teacher_id, null: true
      t.string :order_type, default: "Get Homework Done"
      t.text :special_comments
      t.string :status, default: "Pending"
      t.datetime :deadline
      t.boolean :approved_completion, default: false
      t.string :website
      t.string :credentials
      t.string :subject
      t.string :topic
      t.text :about_homework

      t.timestamps
    end
    add_index :orders, :student_id
    add_index :orders, :teacher_id
  end
end
