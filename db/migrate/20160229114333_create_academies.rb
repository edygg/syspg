class CreateAcademies < ActiveRecord::Migration
  def change
    create_table :academies do |t|
      t.string :name
      t.string :phone
      
      t.belongs_to :user
      t.belongs_to :campu
      t.belongs_to :major

      t.timestamps null: false
    end
  end
end
