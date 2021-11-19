class BusyTimesController < ApplicationController
  before_action :set_busy_time, only: %i[ show edit update destroy ]

  # GET /busy_times or /busy_times.json
  def index
    @busy_times = BusyTime.all
  end

  # GET /busy_times/1 or /busy_times/1.json
  def show
  end

  # GET /busy_times/new
  def new
    @busy_time = BusyTime.new
  end

  # GET /busy_times/1/edit
  def edit
  end

  # POST /busy_times or /busy_times.json
  def create
    @busy_time = BusyTime.new(busy_time_params)

    respond_to do |format|
      if @busy_time.save
        format.html { redirect_to @busy_time, notice: "Busy time was successfully created." }
        format.json { render :show, status: :created, location: @busy_time }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @busy_time.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /busy_times/1 or /busy_times/1.json
  def update
    respond_to do |format|
      if @busy_time.update(busy_time_params)
        format.html { redirect_to @busy_time, notice: "Busy time was successfully updated." }
        format.json { render :show, status: :ok, location: @busy_time }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @busy_time.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /busy_times/1 or /busy_times/1.json
  def destroy
    @busy_time.destroy
    respond_to do |format|
      format.html { redirect_to busy_times_url, notice: "Busy time was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_busy_time
      @busy_time = BusyTime.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def busy_time_params
      params.require(:busy_time).permit(:employee_id, :start_time, :end_time)
    end
end
