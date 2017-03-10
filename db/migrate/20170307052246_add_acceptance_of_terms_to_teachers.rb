class AddAcceptanceOfTermsToTeachers < ActiveRecord::Migration[5.0]
  def change
    add_column :teachers, :acceptance_of_terms, :boolean, default: false
  end
end
