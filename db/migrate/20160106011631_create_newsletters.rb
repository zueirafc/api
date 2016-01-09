class CreateNewsletters < ActiveRecord::Migration
  def change
    create_table :newsletters do |t|
      t.string :email
      t.boolean :is_accepted_partner
      t.integer :status, index: true

      t.timestamps null: false
    end

    add_index :newsletters, :email, unique: true
  end
end
