class CreateProfessionalPractices < ActiveRecord::Migration
  def change
    create_table :professional_practices do |t|
      t.string :area
      t.string :charge
      t.string :objective
      t.string :daily_tasks
      t.string :observation
      t.boolean :hire_probability, default: false
      t.boolean :flexitime, default: false
      t.belongs_to :company

      t.timestamps null: false
    end
  end
end
