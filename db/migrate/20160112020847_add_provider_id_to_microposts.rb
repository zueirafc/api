class AddProviderIdToMicroposts < ActiveRecord::Migration
  def change
    add_column :microposts, :provider_id, :string, null: false
    add_column :microposts, :provider_url, :string
    add_column :microposts, :title, :string

    change_column :microposts, :status, :integer, default: 0
    change_column :microposts, :user_id, :integer, null: true

    add_index :microposts, [:provider_id, :source_id], unique: true

    remove_column :media, :kind

    remove_column :users, :confirmation_token
    remove_column :users, :confirmed_at
    remove_column :users, :confirmation_sent_at
    remove_column :users, :unconfirmed_email
  end
end
