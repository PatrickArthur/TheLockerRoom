class ProfilesController < ApplicationController
  skip_before_filter :verify_authenticity_token
  before_filter :authenticate_user!
  before_action :set_profile, only: [:show, :edit, :update, :destroy]


  # GET /profiles
  # GET /profiles.json
  def index
    @sports = [ "Football", "Baseball", "Basketball", "Rugby Union", "Rugby Leagure", "MMA", "Boxing", "Wrestling", "Soccer", "Track&Field","Lacrosse", "Field Hockey", "Ice Hockey", "Golf", "Australian Rules Football"]

    if params[:search] && params[:search][:sport]
      @profiles = Profile.where(sport: params[:search][:sport])
    else
      @profiles = Profile.all
    end
  end


  # GET /profiles/1
  # GET /profiles/1.json
  def show
    @profile = Profile.find(params[:id]) || current_user.profile
  end

  # GET /profiles/new
  def new
    @profile = Profile.new
  end

  # GET /profiles/1/edit
  def edit
    @profile = Profile.find(params[:id])
  end

  # POST /profiles
  # POST /profiles.json
  def create
    @profile = current_user.create_profile(profile_params)
    @post = @profile.posts.create(post_params)
    @profile.bmi = ((@profile.weight*703)/(@profile.height**2))

    # if @profile.gender == "Male"
    #   @profile.bodyfat=((86.01*Math.log10((@profile.waist) - (@profile.neck))) - (70.041*Math.log10(@profile.height)) + 36.76).to_i

    # else
    #   if @profile.gender == "Female"
    #     @profile.bodyfat=(163.205*math.log10((@profile.waist) - (@profile.hip) + (@profile.neck)) - 97.684*math.log10(@profile.height) - 78.387).to_i
    #   end
    # end

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
      params.require(:profile).permit(:first_name,:last_name,:sport,:team,:position,:address,
        :city,:state,:country,:zip,:phone,:email,:gender,:age,:weight,:height,:waist,
        :neck,:hip,:bench,:squat,:deadlift,:powerclean,:cleanpress,:description,:avatar)
    end

    def post_params
      params.require(:post).permit(:status)
    end
end


