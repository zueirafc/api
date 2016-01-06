class CreateMedia < ActiveRecord::Migration
  def change
    create_table :media do |t|
      t.references :micropost, index: true, foreign_key: true
      t.string :file
      t.integer :kind

      t.timestamps null: false
    end
    add_index :media, :kind
  end
end
