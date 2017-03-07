class CreateStudents < ActiveRecord::Migration[5.0]
  def change
    create_table :students do |t|
      t.string :username
      t.string :password_digest
      t.string :password_confirmation

      t.timestamps
    end
  end
end
