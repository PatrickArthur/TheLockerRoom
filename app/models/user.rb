class User < ActiveRecord::Base
  acts_as_messageable
  has_one :profile
  has_many :posts

  def mailboxer_email(object)
 #return the model's email here
end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
