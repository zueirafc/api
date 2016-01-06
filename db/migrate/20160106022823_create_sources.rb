class CreateSources < ActiveRecord::Migration
  def change
    create_table :sources do |t|
      t.string :name, null: false
      t.string :key, null: false
      t.integer :kind, index: true, null: false
      t.integer :status, index: true, null: false
      t.references :club, index: true
    end

    add_foreign_key :sources, :clubs, column: :club_id
    add_foreign_key :microposts, :sources, column: :source_id
  end
end
