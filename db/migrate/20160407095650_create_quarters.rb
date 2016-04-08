class CreateQuarters < ActiveRecord::Migration
  def change
    create_table :quarters do |t|
      t.integer :period
      t.integer :year

      t.timestamps null: false
    end
  end
end
