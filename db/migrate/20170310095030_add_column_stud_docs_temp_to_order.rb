class AddColumnStudDocsTempToOrder < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, :stud_docs_tmp, :string
  end
end
