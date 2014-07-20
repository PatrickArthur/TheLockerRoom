class ProfilesController < ApplicationController
  include Math
  skip_before_filter :verify_authenticity_token
  before_filter :authenticate_user!
  before_action :set_profile, only: [:show, :edit, :update, :destroy]



  # GET /profiles
  # GET /profiles.json
  def index
    @sports = [ "Football", "Baseball", "Basketball", "Rugby Union", "Rugby Leagure", "MMA", "Boxing", "Wrestling", "Soccer", "Track&Field","Lacrosse", "Field Hockey", "Ice Hockey", "Golf", "Australian Rules Football"]
    @weights = [ '0-100','101-125','126-150','151-175','176-200','201-225','226-250',
      '251-275','276-300','301-400']
    @ages = [ '0-10', '11-20', '21-30', '31-40', '41-50', '51-60', '61-70', '71-80', '91-100']
    @bmis = [ '0-5', '5-10', '11-15', '16-20', '21-25', '26-30', '31-35', '36-40']
    @bfs = [ '0-5', '5-10', '11-15', '16-20', '21-25', '26-30', '31-35', '36-40','41-45','46-50']

    @profiles = Profile.all

    # @friendship = current_user.profile.friendship(@profile)

    if params[:search]
      if params[:search][:age]
        start_age = params[:search][:age].split('-')[0].to_i
        end_age = params[:search][:age].split('-')[1].to_i
      else
        start_age = 0
        end_age = 200
      end

      if params[:search][:weight]
        start_bmi = params[:search][:weight].split('-')[0].to_i
        end_bmi = params[:search][:weight].split('-')[1].to_i
      else
        start_wt = 0
        end_wt = 500
      end

      if params[:search][:bmi]
        start_bmi = params[:search][:bmi].split('-')[0].to_i
        end_bmi = params[:search][:bmi].split('-')[1].to_i
      else
        start_bmi = 0
        end_bmi = 100
      end

      if params[:search][:bodyfat]
        start_bmi = params[:search][:bodyfat].split('-')[0].to_i
        end_bmi = params[:search][:bodyfat].split('-')[1].to_i
      else
        start_bodyfat = 0
        end_bodyfat = 100
      end


      @profiles = Profile.where('sport LIKE ? and position LIKE ? and age BETWEEN ? and ?
        and weight BETWEEN ? and ? and bmi BETWEEN ? and ? and bodyfat BETWEEN ? and ?',
        "%#{params[:search][:sport]}%",
        "%#{params[:search][:position]}",
        start_age,
        end_age,
        start_wt,
        end_wt,
        start_bmi,
        end_bmi,
        start_bodyfat,
        end_bodyfat)
    end
  end


  # GET /profiles/1
  # GET /profiles/1.json
  def show
    @profile = Profile.find(params[:id]) || current_user.profile
    @posts = @profile.posts.order('created_at DESC').page(params[:page]).per(3)
    @comments = @profile.comments.order('created_at_desc').page(params[:page]).per(3)
    @images = @profile.posts.order('created_at DESC').page(params[:imagespage]).per(25)
    @connects = @profile.friends.order('created_at DESC').page(params[:connectpage]).per(2)
    @friendship = current_user.profile.friendship(@profile)
    @followers = @profile.friends.count


    #@top_25_posts =
    # @news_items = @posts + @comments + @images
  end

  # GET /profiles/new
  def new
    @profile = Profile.new
    @profile.teams << Team.new
    @post = Post.new
    @comment = Comment.new
  end

  # GET /profiles/1/edit
  def edit
    @profile = Profile.find(params[:id])
    @profile.teams << Team.new unless @profile.teams.present?
  end

  # POST /profiles
  # POST /profiles.json



  def create
    @profile = current_user.create_profile(profile_params)

    @profile.bmi = ((@profile.weight*703)/(@profile.height**2))

    if @profile.gender == "Male"
      @profile.bodyfat=((86.01*Math.log10((@profile.waist) - (@profile.neck))) - (70.041*Math.log10(@profile.height)) + 36.76)

    else
      if @profile.gender == "Female"
        @profile.bodyfat=(163.205*math.log10((@profile.waist) - (@profile.hip) + (@profile.neck)) - 97.684*math.log10(@profile.height) - 78.387)
      end
    end

    respond_to do |format|
      if @profile.save
        format.html { redirect_to profiles_path, notice: 'Profile was successfully created.' }
        format.json { render action: 'index', status: :created, location: @profile }
      else
        format.html { render action: 'new' }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /profiles/1
  # PATCH/PUT /profiles/1.json
  def update

    @profile.bmi = ((@profile.weight*703)/(@profile.height**2))

    if @profile.gender == "Male"
      @profile.bodyfat=((86.01*Math.log10((@profile.waist) - (@profile.neck))) - (70.041*Math.log10(@profile.height)) + 36.76)

    else
      if @profile.gender == "Female"
        @profile.bodyfat=(163.205*math.log10((@profile.waist) - (@profile.hip) + (@profile.neck)) - 97.684*math.log10(@profile.height) - 78.387)
      end
    end
    respond_to do |format|
      if @profile.update(profile_params)
        format.html { redirect_to @profile, notice: 'Profile was successfully updated.' }
        format.json { render :show, status: :ok, location: @profile }
      else
        format.html { render :edit }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /profiles/1
  # DELETE /profiles/1.json
  def destroy
    @profile.destroy
    respond_to do |format|
      format.html { redirect_to profiles_url, notice: 'Profile was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_profile
      @profile = Profile.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def profile_params
      params.require(:profile).permit(:first_name,:last_name,:sport,:position,:curteam,:address,
        :city,:state,:country,:zip,:phone,:email,:gender,:age,:weight,:height,:waist,
        :neck,:hip,:bench,:squat,:deadlift,:powerclean,:cleanpress,:description,:avatar,
        teams_attributes: [:id, :athleteteam,:teamlogo,:startyear,:endyear,:website])
    end

end






