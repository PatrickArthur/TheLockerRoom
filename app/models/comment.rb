class Comment < ActiveRecord::Base
  belongs_to :profile
  belongs_to :post
  validates_presence_of :profile_id, :post_id
  validates :comment, :presence => true
  acts_as_votable
  paginates_per 5
   auto_html_for :comment do
    html_escape
    image
    youtube(:width => 400, :height => 250, :autoplay => false)
    vimeo(:width => 400, :height => 250, :autoplay => false)
    link :target => "_blank", :rel => "nofollow"
    simple_format
  end
end
