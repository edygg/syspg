class CreateGraduationProjectsMajors < ActiveRecord::Migration
  def change
    create_table :graduation_projects_majors do |t|
      t.belongs_to :graduation_project
      t.belongs_to :major
    end
  end
end
