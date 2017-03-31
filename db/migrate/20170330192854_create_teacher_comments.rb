class CreateTeacherComments < ActiveRecord::Migration[5.0]
  def change
    create_table :teacher_comments do |t|
      t.string :comment
      t.integer :teacher_id
      t.integer :student_id

      t.timestamps
    end
    add_index :teacher_comments, :teacher_id
    add_index :teacher_comments, :student_id
  end
end
