class CreateFriendships < ActiveRecord::Migration
  def change
    create_table :friendships do |t|
      t.string :profile_id
      t.string :friend_id
      t.timestamps
    end
    add_index :friendships,:profile_id
    add_index :friendships,:friend_id
  end
end
