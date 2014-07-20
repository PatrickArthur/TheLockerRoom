class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.integer :profile_id
      t.string :athleteteam
      t.timestamps
    end
  end
end
