class CreateAssignments < ActiveRecord::Migration
  def change
    create_table :assignments do |t|
      t.string :name
      t.string :dead_line
      t.string :assignment_type
      t.string :description
      t.decimal :total_grade, precision: 5, scale: 2
      t.belongs_to :classroom

      t.timestamps null: false
    end
  end
end
