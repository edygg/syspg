class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name
      t.string :phone
      t.string :web_site
      t.string :contact_name
      t.string :contact_email
      t.string :contact_phone
      t.string :contact_job_title

      t.timestamps null: false

      t.belongs_to :user
      t.belongs_to :company_category
    end
  end
end
