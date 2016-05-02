class AddEmailToContactCategories < ActiveRecord::Migration
  def change
    add_column :contact_categories, :email, :string, null: false
  end
end
