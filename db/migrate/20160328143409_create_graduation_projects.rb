class CreateGraduationProjects < ActiveRecord::Migration
  def change
    create_table :graduation_projects do |t|
      t.string :name
      t.string :description
      t.string :objective
      t.string :requirements
      t.boolean :active, default: true

      t.belongs_to :company

      t.timestamps null: false
    end
  end
end
