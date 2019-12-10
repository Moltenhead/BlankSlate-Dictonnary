# frozen_string_literal: true

module Models
  class ApplicationController < ::ActionController::Base
    before_action :set_instance, only: [:show, :edit, :update, :destroy]

    @@module_name = nil

    def initialize
      super
      @model_name = (@@module_name ? "#{@@module_name}::" : '') + controller_name.classify
      begin
        @model = @model_name.constantize if @model_name && @model_name != 'Application'
      rescue NameError => e
        Rails.logger.warn "TEST was unable to process model or serializer #{e}"
      end
    end

    # GET /instances
    # GET /instances.json
    def index
      puts "all is #{@model.all}"
      @instances = @model.all
    end

    # GET /instances/1
    # GET /instances/1.json
    def show
      if @instance
        format.html { redirect_to @instance }
        format.json { render :show, status: :found, location: @instance }
      else
        format.html { render :show, status: :not_found }
        format.json { render json: @instance.errors, status: :unprocessable_entity }
      end
    end

    # GET /instances/new
    def new
      @instance = @model.new
    end

    # GET /instances/1/edit
    def edit
    end

    # POST /instances
    # POST /instances.json
    def create
      @instance = @model.new(instance_params)

      respond_to do |format|
        if @instance.save
          format.html { redirect_to @instance, notice: "#{@model} was successfully created." }
          format.json { render :show, status: :created, location: @instance }
        else
          format.html { render :new }
          format.json { render json: @instance.errors, status: :unprocessable_entity }
        end
      end
    end

    # PATCH/PUT /instances/1
    # PATCH/PUT /instances/1.json
    def update
      respond_to do |format|
        if @instance.update(instance_params)
          format.html { redirect_to @instance, notice: "#{@model} was successfully updated." }
          format.json { render :show, status: :ok, location: @instance }
        else
          format.html { render :edit }
          format.json { render json: @instance.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /instances/1
    # DELETE /instances/1.json
    def destroy
      @instance.destroy
      respond_to do |format|
        format.html { redirect_to instances_url, notice: "#{@model} was successfully destroyed." }
        format.json { head :no_content }
      end
    end

    class << self
      def module_name(module_name)
        @@module_name = module_name
      end
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_instance
      @instance = @model.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def instance_params
      params.fetch(:instance, {})
    end
  end
end
