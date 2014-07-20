class AddWebYearTeam < ActiveRecord::Migration

  def self.up
    add_column :teams, :startyear, :string
    add_column :teams, :endyear, :string
    add_column :teams, :website, :string
  end

  def self.down
    remove_column :teams, :startyear, :string
    remove_column :teams, :endyear, :string
    remove_column :teams, :website, :string
  end
end
