class CreateNicknameFans < ActiveRecord::Migration
  def change
    create_table :nickname_fans do |t|
      t.string :name, null: false
      t.string :plural
      t.integer :status, index: true
      t.references :club, index: true

      t.timestamps null: false
    end

    add_foreign_key :nickname_fans, :clubs, column: :club_id
  end
end
