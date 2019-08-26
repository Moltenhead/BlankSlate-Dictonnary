class LanguageConceptsController < ApplicationController
  before_action :set_language_concept, only: [:show, :edit, :update, :destroy]

  # GET /language_concepts
  # GET /language_concepts.json
  def index
    @language_concepts = LanguageConcept.all
  end

  # GET /language_concepts/1
  # GET /language_concepts/1.json
  def show
  end

  # GET /language_concepts/new
  def new
    @language_concept = LanguageConcept.new
  end

  # GET /language_concepts/1/edit
  def edit
  end

  # POST /language_concepts
  # POST /language_concepts.json
  def create
    @language_concept = LanguageConcept.new(language_concept_params)

    respond_to do |format|
      if @language_concept.save
        format.html { redirect_to @language_concept, notice: 'Language concept was successfully created.' }
        format.json { render :show, status: :created, location: @language_concept }
      else
        format.html { render :new }
        format.json { render json: @language_concept.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /language_concepts/1
  # PATCH/PUT /language_concepts/1.json
  def update
    respond_to do |format|
      if @language_concept.update(language_concept_params)
        format.html { redirect_to @language_concept, notice: 'Language concept was successfully updated.' }
        format.json { render :show, status: :ok, location: @language_concept }
      else
        format.html { render :edit }
        format.json { render json: @language_concept.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /language_concepts/1
  # DELETE /language_concepts/1.json
  def destroy
    @language_concept.destroy
    respond_to do |format|
      format.html { redirect_to language_concepts_url, notice: 'Language concept was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_language_concept
      @language_concept = LanguageConcept.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def language_concept_params
      params.require(:language_concept).permit(:roman, :run, :phonologie, :description)
    end
end
