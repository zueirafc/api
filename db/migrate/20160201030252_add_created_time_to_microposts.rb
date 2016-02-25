class AddCreatedTimeToMicroposts < ActiveRecord::Migration
  def change
    add_column :microposts, :created_time, :datetime
  end
end
