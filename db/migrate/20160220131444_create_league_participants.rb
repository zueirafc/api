class CreateLeagueParticipants < ActiveRecord::Migration
  def change
    create_table :league_participants do |t|
      t.references :club, index: true
      t.references :edition, index: true
    end

    add_foreign_key :league_participants, :clubs, column: :club_id
    add_foreign_key :league_participants, :league_editions, column: :edition_id
  end
end
