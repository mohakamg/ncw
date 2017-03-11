class AddStudDocsToOrder < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, :stud_docs, :string, array: true, default: []
  end
end
