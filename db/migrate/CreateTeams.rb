class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :profile_id
      t.string :athleteteam
      t.timestamps
    end
  end
end
