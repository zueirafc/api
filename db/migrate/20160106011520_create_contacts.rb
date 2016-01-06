class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :email, index: true, null: false
      t.string :name, null: false
      t.integer :status, index: true, null: false
      t.text :message, null: false
      t.references :contact_category, index: true

      t.timestamps null: false
    end

    add_foreign_key :contacts, :contact_categories, column: :contact_category_id
  end
end
