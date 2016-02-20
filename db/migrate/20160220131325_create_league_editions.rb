class CreateLeagueEditions < ActiveRecord::Migration
  def change
    create_table :league_editions do |t|
      t.date :edition_at
      t.integer :status

      t.references :league, index: true
      t.references :champion, index: true

      t.timestamps null: false
    end

    add_foreign_key :league_editions, :leagues, column: :league_id
    add_foreign_key :league_editions, :clubs, column: :champion_id
  end
end
