class AddUploadProfile < ActiveRecord::Migration
  def self.up
    add_attachment :profiles, :upload
  end

  def self.down
    remove_attachment :profiles, :upload
  end
end
