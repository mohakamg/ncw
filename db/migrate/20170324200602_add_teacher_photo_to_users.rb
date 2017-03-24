class AddTeacherPhotoToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :teachers, :profile_pic, :string
  end
end
