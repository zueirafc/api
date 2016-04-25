class RenameClubAssociationInSources < ActiveRecord::Migration
  def change
    rename_column :sources, :club_id, :troller_id
    add_column :sources, :target_id, :integer

    add_index :sources, :target_id
    add_foreign_key :sources, :clubs, column: :target_id
  end
end
