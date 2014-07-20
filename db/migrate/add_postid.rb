class AddPostIdProfile < ActiveRecord::Migration
   def self.up
    add_column :profiles, :post_id, :string
  end

  def self.down
    remove_column :profiles, :post_id, :string
  end
end
