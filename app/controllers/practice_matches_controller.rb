class PracticeMatchesController < ApplicationController
  before_action :set_practice_match, only: %i[ show edit update destroy ]

  # GET /practice_matches or /practice_matches.json
  def index
    @q = PracticeMatch.ransack(params[:q])
  end

  # GET /practice_matches/1 or /practice_matches/1.json
  def show
    @practice_match = PracticeMatch.find(practice_match_params[:id])
  end

  # GET /practice_matches/new
  def new
    @practice_match = PracticeMatch.new
  end

  # GET /practice_matches/1/edit
  def edit
    @practice_match = PracticeMatch.find(practice_match_params[:id])
  end

  # POST /practice_matches or /practice_matches.json
  def create
    @practice_match = PracticeMatch.new(practice_match_params)

    respond_to do |format|
      if @practice_match.save
        format.html { redirect_to @practice_match, notice: "Practice match was successfully created." }
        format.json { render :show, status: :created, location: @practice_match }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @practice_match.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /practice_matches/1 or /practice_matches/1.json
  def update
    respond_to do |format|
      if @practice_match.update(practice_match_params)
        format.html { redirect_to @practice_match, notice: "Practice match was successfully updated." }
        format.json { render :show, status: :ok, location: @practice_match }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @practice_match.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /practice_matches/1 or /practice_matches/1.json
  def destroy
    @practice_match.destroy!

    respond_to do |format|
      format.html { redirect_to practice_matches_path, status: :see_other, notice: "Practice match was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_practice_match
      @practice_match = PracticeMatch.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.コメント ストパラフォームのやつも作成？
    def practice_match_params
      params.expect(practice_match: [ :schedule, :place, :number_of_accept, :remarks, :created_at, :updated_at, :prefecture, :city, :genre_generation[], :sports ])
    end
end
