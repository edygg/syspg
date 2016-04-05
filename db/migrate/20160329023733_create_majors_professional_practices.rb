class CreateMajorsProfessionalPractices < ActiveRecord::Migration
  def change
    create_table :majors_professional_practices do |t|
      t.belongs_to :major
      t.belongs_to :professional_practice
    end
  end
end
