class FixProfileColumn < ActiveRecord::Migration
   def change
    change_table :profiles do |t|
      t.rename :team, :curteam
    end
  end
end
