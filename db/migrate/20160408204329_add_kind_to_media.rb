class AddKindToMedia < ActiveRecord::Migration
  def change
    add_column :media, :kind, :integer, default: 2
    add_index :media, :kind
  end
end
