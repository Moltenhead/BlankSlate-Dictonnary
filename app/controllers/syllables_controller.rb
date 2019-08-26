class SyllablesController < ApplicationController
  before_action :set_syllable, only: [:show, :edit, :update, :destroy]

  # GET /syllables
  # GET /syllables.json
  def index
    @syllables = Syllable.all
  end

  # GET /syllables/1
  # GET /syllables/1.json
  def show
  end

  # GET /syllables/new
  def new
    @syllable = Syllable.new
  end

  # GET /syllables/1/edit
  def edit
  end

  # POST /syllables
  # POST /syllables.json
  def create
    @syllable = Syllable.new(syllable_params)

    respond_to do |format|
      if @syllable.save
        format.html { redirect_to @syllable, notice: 'Syllable was successfully created.' }
        format.json { render :show, status: :created, location: @syllable }
      else
        format.html { render :new }
        format.json { render json: @syllable.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /syllables/1
  # PATCH/PUT /syllables/1.json
  def update
    respond_to do |format|
      if @syllable.update(syllable_params)
        format.html { redirect_to @syllable, notice: 'Syllable was successfully updated.' }
        format.json { render :show, status: :ok, location: @syllable }
      else
        format.html { render :edit }
        format.json { render json: @syllable.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /syllables/1
  # DELETE /syllables/1.json
  def destroy
    @syllable.destroy
    respond_to do |format|
      format.html { redirect_to syllables_url, notice: 'Syllable was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_syllable
      @syllable = Syllable.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def syllable_params
      params.require(:syllable).permit(:roman, :rune, :phonologie)
    end
end
