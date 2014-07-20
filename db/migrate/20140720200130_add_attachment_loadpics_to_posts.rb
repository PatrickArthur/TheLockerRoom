class AddAttachmentLoadpicsToPosts < ActiveRecord::Migration
  def self.up
    change_table :posts do |t|
      t.attachment :loadpic
    end
  end

  def self.down
    drop_attached_file :posts, :loadpic
  end
end
