class CreateFrequentlyAskedQuestions < ActiveRecord::Migration
  def change
    create_table :frequently_asked_questions do |t|
      t.string :question
      t.string :answer

      t.timestamps null: false
    end
  end
end
