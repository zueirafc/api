class AddRootUrlToSources < ActiveRecord::Migration
  def change
    add_column :sources, :root_url, :string
  end
end
