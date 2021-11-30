class BusiesController < ApplicationController
  before_action :set_busy, only: %i[ show edit update destroy ]

  # GET /busies or /busies.json
  def index
    @busies = Busy.all
  end

  # GET /busies/1 or /busies/1.json
  def show
  end

  # GET /busies/new
  def new
    @busy = Busy.new
  end

  # GET /busies/1/edit
  def edit
  end

  # POST /busies or /busies.json
  def create
    @busy = Busy.new(busy_params)

    respond_to do |format|
      if @busy.save
        format.html { redirect_to @busy, notice: "Busy was successfully created." }
        format.json { render :show, status: :created, location: @busy }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @busy.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /busies/1 or /busies/1.json
  def update
    respond_to do |format|
      if @busy.update(busy_params)
        format.html { redirect_to @busy, notice: "Busy was successfully updated." }
        format.json { render :show, status: :ok, location: @busy }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @busy.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /busies/1 or /busies/1.json
  def destroy
    @busy.destroy
    respond_to do |format|
      format.html { redirect_to busies_url, notice: "Busy was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_busy
      @busy = Busy.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def busy_params
      params.require(:busy).permit(:start_time, :end_time, :employee_id)
    end
end
