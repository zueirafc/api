class CreateMedia < ActiveRecord::Migration
  def change
    create_table :media do |t|
      t.string :file
      t.integer :kind, index: true, null: false

      t.references :micropost, index: true

      t.timestamps null: false
    end

    add_foreign_key :media, :microposts, column: :micropost_id
  end
end
