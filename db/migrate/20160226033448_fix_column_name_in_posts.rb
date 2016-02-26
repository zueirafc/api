class FixColumnNameInPosts < ActiveRecord::Migration
  def change
    remove_column :microposts, :created_time
    add_column :microposts, :created_time, :datetime, default: Time.now
  end
end
