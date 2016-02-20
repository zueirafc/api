class CreateLeagues < ActiveRecord::Migration
  def change
    create_table :leagues do |t|
      t.string :name, limit: 60, null: false
      t.string :country, limit: 60, null: false
      t.integer :status, index: true, null: false
      t.string :codename

      t.timestamps null: false
    end
  end
end
