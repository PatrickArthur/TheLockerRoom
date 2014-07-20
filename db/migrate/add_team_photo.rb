class AddAttachmentTeamlogoToTeams < ActiveRecord::Migration
  def self.up
    change_table :teams do |t|
      t.attachment :teamlogo
    end
  end

  def self.down
    drop_attached_file :teams, :teamlogo
  end
end
