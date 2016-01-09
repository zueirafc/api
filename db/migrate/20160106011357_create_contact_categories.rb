class CreateContactCategories < ActiveRecord::Migration
  def change
    create_table :contact_categories do |t|
      t.string :name, null: false
      t.integer :status, index: true, null: false
    end
  end
end
