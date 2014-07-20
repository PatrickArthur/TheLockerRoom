class Post < ActiveRecord::Base
  # tracked owner: ->(controller, model) { controller && controller.current_user }
  belongs_to :profile
  belongs_to :user
  has_one :image
  has_many :comments
  acts_as_votable
  paginates_per 5
  has_attached_file :loadpic, styles: { small: "64x64#", medium: "200x200#", thumb: "75x75#", test: "25x25#"}
  validates_attachment_content_type :loadpic, :content_type => /\Aimage\/.*\Z/
  has_attached_file :clip, :styles => {
            :medium => { :geometry => "640x480", :format => 'flv'},
            :thumb => {:geometry => "100x100#", :format => 'jpg', :time => 10}
        }, :processors => [:ffmpeg]
    do_not_validate_attachment_file_type(:clip)
  auto_html_for :status do
    html_escape
    image
    youtube(:width => 400, :height => 250, :autoplay => false)
    vimeo(:width => 400, :height => 250, :autoplay => false)
    link :target => "_blank", :rel => "nofollow"
    simple_format
  end
end
