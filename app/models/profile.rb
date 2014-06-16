

class Profile < ActiveRecord::Base
  belongs_to :user
  has_many :posts
  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  def bmi
    bmi=((weight*703)/(height**2))
  end

  def bodyfat
    if gender == "Male"
      86.010*Math.log((waist) - (neck)) - 70.041*Math.log(height) + 36.76
    else
      if gender == "Female"
        163.205*math.log((waist) - (hip) + (neck)) - 97.684*math.log(height) - 78.387
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


  # def test2
  #   Profile.average(:weight)
  # end

end

