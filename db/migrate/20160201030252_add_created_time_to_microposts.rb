class AddCreatedTimeToMicroposts < ActiveRecord::Migration
  def change
    add_column :microposts, :created_time, :date
  end
end
