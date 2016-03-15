class CreateMajors < ActiveRecord::Migration
  def change
    create_table :majors do |t|
      t.string :name
      t.belongs_to :faculty
      
      t.timestamps null: false
    end
  end
end
