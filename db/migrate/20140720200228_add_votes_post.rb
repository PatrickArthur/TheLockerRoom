class AddVotesPost < ActiveRecord::Migration
  def self.up
    add_column :posts, :upvote, :string
    add_column :posts, :downvote, :string
  end

  def self.down
    remove_column :posts, :upvote, :string
    remove_column :posts, :downvote, :string
  end
end
