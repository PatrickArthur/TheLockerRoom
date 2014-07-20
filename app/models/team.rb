class Team < ActiveRecord::Base
  belongs_to :profile
  has_attached_file :teamlogo, styles: { small: "64x64#", medium: "200x200#", thumb: "75x75#", test: "25x25#"}, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :teamlogo, :content_type => /\Aimage\/.*\Z/
end
