class CreateEnrollments < ActiveRecord::Migration
  def change
    create_table :enrollments do |t|
      t.belongs_to :student
      t.belongs_to :professional_practice
      t.belongs_to :graduation_project
      t.boolean :verified, default: false

      t.timestamps null: false
    end
  end
end
