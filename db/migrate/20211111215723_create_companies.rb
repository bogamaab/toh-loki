class CreateCompanies < ActiveRecord::Migration[6.1]
  def change
    create_table :companies do |t|
      t.string :name
      t.string :icon_url
      t.string :ucode
      t.string :country

      t.timestamps
    end
  end
end
