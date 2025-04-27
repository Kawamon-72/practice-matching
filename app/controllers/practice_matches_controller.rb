class PracticeMatchesController < ApplicationController
  before_action :set_practice_match, only: %i[ show edit update destroy ]
  skip_before_action :require_login, only: %i[index]
  # GET /practice_matches or /practice_matches.json
  def index
    @q = PracticeMatch.ransack(params[:q])
    @practice_matches = @q.result(distinct: true).includes(:user)
  end

  # GET /practice_matches/1 or /practice_matches/1.json
  def show
    @practice_match = PracticeMatch.find(params[:id])
  end

  # GET /practice_matches/new
  def new
    @practice_match = PracticeMatch.new
  end

  # GET /practice_matches/1/edit
  def edit
    @practice_match = PracticeMatch.find(params[:id])
  end

  # POST /practice_matches or /practice_matches.json
  def create
    @practice_match = current_user.practice_matches.new(practice_match_params)

    if @practice_match.save
      if params[:practice_match][:prefecture_tag_name].present?
        tag = PrefectureTag.find_or_create_by(name: params[:practice_match][:prefecture_tag_name])
        @practice_match.prefecture_tags << tag unless @practice_match.prefecture_tags.include?(tag)
      end
    
      if params[:practice_match][:city_tag_name].present?
        tag = CityTag.find_or_create_by(name: params[:practice_match][:city_tag_name])
        @practice_match.city_tags << tag unless @practice_match.city_tags.include?(tag)
      end
      redirect_to root_path, notice: "練習試合の募集をしました。" 
    else
      render :new, status: :unprocessable_entity 
    end
  end

  # PATCH/PUT /practice_matches/1 or /practice_matches/1.json
  def update
    prefecture_tag_name = params[:practice_match][:prefecture_tag_name]
    city_tag_name = params[:practice_match][:city_tag_name]
    
    if @practice_match.update(practice_match_params.except(:prefecture_tag_name, :city_tag_name))
      if prefecture_tag_name.present?
        tag = PrefectureTag.find_or_create_by(name: prefecture_tag_name)
        @practice_match.prefecture_tags << tag unless @practice_match.prefecture_tags .include?(tag)
      end
  
      if city_tag_name.present?
        tag = CityTag.find_or_create_by(name: city_tag_name)
        @practice_match.city_tags << tag unless @practice_match.city_tags.include?(tag)
      end
      
      redirect_to @practice_match, notice: "練習試合の募集内容を変更しました。" 
    else
      render :edit, status: :unprocessable_entity 
    end
  end

  # DELETE /practice_matches/1 or /practice_matches/1.json
  def destroy
    @practice_match.destroy!
    redirect_to root_path, status: :see_other, notice: "練習試合募集を削除しました。" 
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_practice_match
      @practice_match = PracticeMatch.find(params[:id])
    end

    # Only allow a list of trusted parameters through.コメント ストパラフォームのやつも作成？
    def practice_match_params
      params.require(:practice_match).permit(:schedule, :place, :number_of_accept, :remarks, :created_at, :updated_at, :sports, genre_generation: [])
    end
end
