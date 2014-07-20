class Profile < ActiveRecord::Base
  belongs_to :user
  has_many :posts, dependent: :destroy
  has_many :images, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :friendships, dependent: :destroy
  has_many :friends, :through => :friendships
  has_many :teams
  acts_as_voter
  accepts_nested_attributes_for :teams, :reject_if => :all_blank, :allow_destroy => true
  has_attached_file :avatar, styles: { small: "64x64#", medium: "200x200#", thumb: "75x75#", test: "25x25#"}, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
  validates_presence_of :first_name
  validates_presence_of :last_name
  validates_presence_of :sport
  validates_presence_of :position
  validates_presence_of :gender
  validates_presence_of :age
  validates_presence_of :weight
  validates_presence_of :height
  validates_presence_of :neck
  validates_presence_of :bench
  validates_presence_of :squat
  validates_presence_of :deadlift
  validates_presence_of :powerclean
  validates_presence_of :cleanpress



  def username
    first_name+" "+last_name
  end

  def location
    city+","+state
  end


  def avgweight
    Profile.where(sport:self.sport,position:self.position).average(:weight).to_i
  end


  def avgheight
    Profile.where(sport:self.sport,position:self.position).average(:height).to_i
  end

   def avgbmi
    Profile.where(sport:self.sport,position:self.position).average(:bmi).to_i
  end

  def avgbf
    Profile.where(sport:self.sport,position:self.position).average(:bodyfat).to_i
  end

  def avgbench
    Profile.where(sport:self.sport,position:self.position).average(:bench).to_i
  end

  def avgsquat
    Profile.where(sport:self.sport,position:self.position).average(:squat).to_i
  end

  def avgdl
    Profile.where(sport:self.sport,position:self.position).average(:deadlift).to_i
  end

  def avgclean
    Profile.where(sport:self.sport,position:self.position).average(:powerclean).to_i
  end

  def avgcleanpress
    Profile.where(sport:self.sport,position:self.position).average(:cleanpress).to_i
  end



  def friends_with(friend)
    friends.include?(friend)
  end

  def friendship(profile)
    friendship = Friendship.where(profile: profile, friend: self).first
    inverse_friendship = Friendship.where(profile: self, friend: profile).first

    if friendship
      friendship
    else
      inverse_friendship
    end
  end
end






