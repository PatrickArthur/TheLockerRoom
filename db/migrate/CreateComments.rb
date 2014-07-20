class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :profile_id
      t.string :post_id
      t.string :comment
      t.timestamps
    end
    add_index :comments, :profile_id
    add_index :comments, :post_id
  end
end
