class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :profile_id
      t.string :upload
      t.string :status

      t.timestamps
    end
  end
end
