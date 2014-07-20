class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :profile_id
      t.integer :post_id
      t.string :comment
      t.timestamps
    end
    add_index :comments, :profile_id
    add_index :comments, :post_id
  end
end
