class AddTeacherDocsToOrder < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, :teacher_docs, :string, array: true, default: []
  end
end
