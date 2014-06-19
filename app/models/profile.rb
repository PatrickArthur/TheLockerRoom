

class Profile < ActiveRecord::Base
  belongs_to :user
  has_many :posts
  has_attached_file :avatar, styles: { small: "100x100#", medium: "200x200#", thumb: "75x75#"}, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/



  def bodyfat
    if gender == "Male"
      ((86.01*Math.log10((waist) - (neck))) - (70.041*Math.log10(height)) + 36.76).to_i

    else
      if gender == "Female"
        (163.205*math.log10((waist) - (hip) + (neck)) - 97.684*math.log10(height) - 78.387).to_i
      end
    end
  end

  def wilks
    sum=bench+squat+deadlift+powerclean+cleanpress
    if gender == "Male"
      a=-216.0475144
      b=16.2606339
      c=-0.002388645
      d=-0.00113732
      e=7.01863E-06
      f=-1.291E-08
    else
      if gender == "Female"
        a=594.31747775582
        b=-27.23842536447
        c=0.82112226871
        d=-0.00930733913
        e=0.00004731582
        f=-0.00000009054
        end
      end

      sum/(a + (b*weight) + ((c*weight) ** 2) + ((d*weight) ** 3) + ((e*weight ** 4) + ((f*weight) ** 5)))
  end

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


end






