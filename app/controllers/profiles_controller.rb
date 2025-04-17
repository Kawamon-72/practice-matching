class ProfilesController < ApplicationController
  before_action :set_profile, only: %i[ show edit update ]

  # GET /profiles/1 or /profiles/1.json
  def new
    @profile = Profile.new
  end

  def show
  end

  # GET /profiles/new
  # GET /profiles/1/edit
  def edit
    @profile = current_user.profile 
  end

  # POST /profiles or /profiles.json
  def create
    @profile = current_user.build_profile(profile_params)

    if @profile.save
      redirect_to root_path, success: "プロフィールが作成されました。"
    else
      flash.now['danger'] = 'プロフィールが保存されませんでした。'
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /profiles/1 or /profiles/1.json
  def update
    if @profile.update(profile_params)
      redirect_to profile_path, success: "プロフィールが更新されました。"
    else
      flash.now['danger'] = 'プロフィールが更新されませんでした。'
      render :edit, status: :unprocessable_entity
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_profile
      @profile = current_user.profile
    end

    # Only allow a list of trusted parameters through.
    def profile_params
      params.require(:profile).permit(:user_id, :name, :location, :introduction, :avatar, :avatar_cache)
    end
end
