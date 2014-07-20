class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.integer :profile_id
      t.string :upload
      t.string :status

      t.timestamps
    end
  end
end
