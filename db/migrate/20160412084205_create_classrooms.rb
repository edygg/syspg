class CreateClassrooms < ActiveRecord::Migration
  def change
    create_table :classrooms do |t|
      t.string :section
      t.belongs_to :academy
      t.belongs_to :subject
      t.belongs_to :quarter

      t.timestamps null: false
    end
  end
end
