class BusytimesController < ApplicationController
  before_action :set_busytime, only: %i[ show edit update destroy ]

  # GET /busytimes or /busytimes.json
  def index
    @busytimes = Busytime.all
  end

  # GET /busytimes/1 or /busytimes/1.json
  def show
  end

  # GET /busytimes/new
  def new
    @busytime = Busytime.new
  end

  # GET /busytimes/1/edit
  def edit
  end

  # POST /busytimes or /busytimes.json
  def create
    @busytime = Busytime.new(busytime_params)

    respond_to do |format|
      if @busytime.save
        format.html { redirect_to @busytime, notice: "Busytime was successfully created." }
        format.json { render :show, status: :created, location: @busytime }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @busytime.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /busytimes/1 or /busytimes/1.json
  def update
    respond_to do |format|
      if @busytime.update(busytime_params)
        format.html { redirect_to @busytime, notice: "Busytime was successfully updated." }
        format.json { render :show, status: :ok, location: @busytime }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @busytime.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /busytimes/1 or /busytimes/1.json
  def destroy
    @busytime.destroy
    respond_to do |format|
      format.html { redirect_to busytimes_url, notice: "Busytime was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_busytime
      @busytime = Busytime.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def busytime_params
      params.fetch(:busytime, {})
    end
end
