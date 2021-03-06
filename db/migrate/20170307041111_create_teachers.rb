class CreateTeachers < ActiveRecord::Migration[5.0]
  def change
    create_table :teachers do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :phone
      t.string :password_digest
      t.string :password_confirmation
      t.string :status, default: "The mediocre teacher tells. The good teacher explains. The superior teacher demonstrates. The great teacher inspires."
      t.text :about, default: "Your About You :P should perhaps include:\n\tYour Qualification\n\tYour Teaching Strategies\n\tYour Past Experience\n\tAnd More..."
      t.string :country
      t.string :gender
      t.text :whyme, default: "I respect my kids and they respect me. My explanantions are clear. My expectations are high, but I make sure the kids know how to go about meeting them-- and they do! I'm fair and consistent. I can be counted on to enforce school polidies. I know my math, so you can change my prep on Labor Day and I'll be able to walk into a class two days later and teach it well. The kids enjoy my class because they know they'll walk out of it knowing what they need to know for next year and for the upcoming tests. I realize that, as important as my class is, it's not their only class of the day or the only thing on their minds; I'm competing with soccer and boyfriends and all sorts of crises at home. My kids know that I'm happy to offer extra help or a shoulder to cry on. They know that I'l be friendly, but that I don't intend to become one of their friends, and they respect that.\n\nAs I said, I'm a great teacher!\n\nSomething Like This, You Know..."
      t.boolean :email_confirmed, default: false
      t.boolean :phone_confirmed, default: false
      t.string :email_confirm_token
      t.integer :phone_confirm_code

      t.timestamps
    end
  end
end
