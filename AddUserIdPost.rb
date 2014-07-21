class AddUserIdPost < ActiveRecord::Migration
  def self.up
    add_column :posts, :user_id, :string
  end

  def self.down
    remove_column :posts, :user_id, :string
  end
end