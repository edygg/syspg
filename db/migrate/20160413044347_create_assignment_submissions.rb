class CreateAssignmentSubmissions < ActiveRecord::Migration
  def change
    create_table :assignment_submissions do |t|
      t.belongs_to :student
      t.belongs_to :assignment
      t.decimal :grade, precision: 5, scale: 2
      t.timestamps null: false
    end
  end
end
