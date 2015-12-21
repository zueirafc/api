class CreateSchema < ActiveRecord::Migration
  def change
    create_table :clubs do |t|
      t.string :shield
      t.string :official_website
      t.string :official_facebook_page
      t.string :official_twitter_page
      t.string :short_name
      t.string :full_name
      t.string :initials
    end

    create_table :users do |t|
      t.string :username
      t.string :email
      t.string :name
      t.string :password
      t.string :image
      t.references :club, index: true

      t.timestamps null: false
    end

    add_index :users, :email, unique: true
    add_index :users, :username

    add_foreign_key :users, :clubs, column: :club_id

    create_table :roles do |t|
      t.string   :name,                   null: false
      t.string   :authorizable_type,      null: true
      t.integer  :authorizable_id,        null: true
      t.boolean  :system, default: false, null: false
    end

    add_index :roles, :name
    add_index :roles, [:authorizable_type, :authorizable_id]

    create_table :roles_users, id: false do |t|
      t.references  :user, null: false, index: true
      t.references  :role, null: false, index: true
    end

    create_table :relationships do |t|
      t.integer :follower_id, index: true
      t.integer :followed_id, index: true

      t.timestamps null: false
    end

    add_index :relationships, [:follower_id, :followed_id], unique: true

    create_table :tags do |t|
      t.references :club, index: true
      t.string :name
    end

    add_foreign_key :tags, :clubs, column: :club_id

    create_table :microposts do |t|
      t.references :user, index: true
      t.text :text

      t.timestamps null: false
    end

    add_foreign_key :microposts, :users, column: :user_id

    create_table :post_references do |t|
      t.references :micropost, index: true
      t.references :user, index: true

      t.timestamps null: false
    end

    add_foreign_key :post_references, :microposts, column: :micropost_id
    add_foreign_key :post_references, :users, column: :user_id

    create_table :taggeds do |t|
      t.references :micropost, index: true
      t.references :tag, index: true

      t.timestamps null: false
    end

    add_foreign_key :taggeds, :microposts, column: :micropost_id
    add_foreign_key :taggeds, :tags, column: :tag_id
  end
end
