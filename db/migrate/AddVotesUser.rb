class AddVotesUser < ActiveRecord::Migration
   def self.up
    add_column :users, :upvote, :string
    add_column :users, :downvote, :string
  end

  def self.down
    remove_column :users, :upvote, :string
    remove_column :users, :downvote, :string
  end
end
