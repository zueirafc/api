class DropTableNewsletter < ActiveRecord::Migration
  def change
    drop_table :newsletters
  end
end
