class AddUrlToMedia < ActiveRecord::Migration
  def change
    add_column :media, :url, :string
  end
end
