class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :name
      t.string :unitec_id
      t.string :phone
      t.boolean :available, default: true

      t.belongs_to :user
      t.belongs_to :campu
      t.belongs_to :major

      t.timestamps null: false
    end
  end
end
