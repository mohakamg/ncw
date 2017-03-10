class EditColumnInTeacher < ActiveRecord::Migration[5.0]
  def change
    change_column :teachers, :about, :text, default: "Your About You :P should perhaps include:<br>
                                                      <ul>
                                                      	<li>Your Qualification</li>
                                                      	<li>Your Teaching Strategies</li>
                                                      	<li>Your Past Experience</li>
                                                      	And More...
                                                      </ul>
                                                      "

  change_column :teachers, :whyme, :text, default: "I respect my kids and they respect me. My explanantions are clear. My expectations are high, but I make sure the kids know how to go about meeting them-- and they do! I'm fair and consistent. I can be counted on to enforce school polidies. I know my math, so you can change my prep on Labor Day and I'll be able to walk into a class two days later and teach it well. The kids enjoy my class because they know they'll walk out of it knowing what they need to know for next year and for the upcoming tests. I realize that, as important as my class is, it's not their only class of the day or the only thing on their minds; I'm competing with soccer and boyfriends and all sorts of crises at home. My kids know that I'm happy to offer extra help or a shoulder to cry on. They know that I'l be friendly, but that I don't intend to become one of their friends, and they respect that.<br><br>

                                        <h2>As I said, I'm a great teacher!</h2><br>

                                        Something Like This, You Know..."
  end
end
