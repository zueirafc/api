class AddProviderIdToMicroposts < ActiveRecord::Migration
  def change
    add_column :microposts, :provider_id, :string
    change_column :microposts, :status, :integer, default: 0

    add_index :microposts, [:provider_id, :source_id], unique: true
  end
end
