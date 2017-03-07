class AddAcceptanceOfTermsToStudents < ActiveRecord::Migration[5.0]
  def change
    add_column :students, :acceptance_of_terms, :boolean, default: false
  end
end
