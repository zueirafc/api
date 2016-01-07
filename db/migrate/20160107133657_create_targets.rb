class CreateTargets < ActiveRecord::Migration
  def change
    create_table :targets do |t|
      t.references :micropost, index: true, foreign_key: true
      t.references :targetable, polymorphic: true, index: true

      t.timestamps null: false
    end
  end
end
