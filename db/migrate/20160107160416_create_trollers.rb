class CreateTrollers < ActiveRecord::Migration
  def change
    create_table :trollers do |t|
      t.references :micropost, index: true, foreign_key: true
      t.references :trollerable, polymorphic: true, index: true

      t.timestamps null: false
    end
  end
end
