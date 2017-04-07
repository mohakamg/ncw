class AddTokentToStudents < ActiveRecord::Migration[5.0]
  def change
    add_column :students, :token, :string
  end
end
