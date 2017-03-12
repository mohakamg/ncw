class AddStudentPastedImageToOrders < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, :stud_pasted_images, :string, array: true, default: []
  end
end
