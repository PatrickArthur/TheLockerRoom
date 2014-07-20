class AddAttachmentClipToPosts < ActiveRecord::Migration
  def self.up
    change_table :posts do |t|
      t.attachment :clip
    end
  end

  def self.down
    drop_attached_file :posts, :clip
  end
end
