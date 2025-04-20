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
    @profile = current_user.build_profile(profile_params.except(:genre_generation_name, :sports_tags_name))


    if @profile.save
      if params[:profile][:genre_generation_name].present?
        tag = GenreGenerationTag.find_or_create_by(name: params[:profile][:genre_generation_name])
        @profile.genre_generation_tags << tag unless @profile.genre_generation_tags.include?(tag)
      end
    
      if params[:profile][:sports_tags_name].present?
        tag = SportsTag.find_or_create_by(name: params[:profile][:sports_tags_name])
        @profile.sports_tags << tag unless @profile.sports_tags.include?(tag)
      end

      redirect_to profile_path, success: "プロフィールが作成されました。"
    else
      flash.now['danger'] = 'プロフィールが保存されませんでした。'
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /profiles/1 or /profiles/1.json
  def update
    # タグの処理
    genre_generation_name = params[:profile][:genre_generation_name]
    sports_tag_name = params[:profile][:sports_tags_name]
  
    if @profile.update(profile_params.except(:genre_generation_name, :sports_tags_name))
      # 中間テーブルへの関連付け
      if genre_generation_name.present?
        tag = GenreGenerationTag.find_or_create_by(name: genre_generation_name)
        @profile.genre_generation_tags << tag unless @profile.genre_generation_tags.include?(tag)
      end
  
      if sports_tag_name.present?
        tag = SportsTag.find_or_create_by(name: sports_tag_name)
        @profile.sports_tags << tag unless @profile.sports_tags.include?(tag)
      end
  
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
      params.require(:profile).permit(:user_id, :name, :location, :genre_generation_name, :sports_tags_name, :introduction, :avatar, :avatar_cache)
    end
end
