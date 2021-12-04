class EmployeesController < ApplicationController
  before_action :set_employee, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :current_user, only: [:edit, :update, :destroy]

  # GET /employees or /employees.json
  def index

    if params[:start_time].present? && params[:end_time].present?

      
      start_time = params[:start_time].to_datetime
      end_time = params[:end_time].to_datetime

      @employees = Employee.joins("left outer join busies 
                              on (busies.start_time > '#{start_time}'
                              and busies.start_time < '#{end_time}')
                              or (busies.end_time > '#{start_time}'
                              and busies.end_time < '#{end_time}') "
                              ).where(busies: {id: nil}) 
      
      flash.now[:notice] = "Employees available for your shift are listed below."
      
  
    else
      @employees = Employee.all
    end
  end

  # GET /employees/1 or /employees/1.json
  def show
  end

  # GET /employees/new
  def new
    #@employee = Employee.new
    @employee = current_user.employees.build
  end

  # GET /employees/1/edit
  def edit
  end

  # POST /employees or /employees.json
  def create
    #@employee = Employee.new(employee_params)
    @employee = current_user.employees.build(employee_params)

    respond_to do |format|
      if @employee.save
        format.html { redirect_to @employee, notice: "Employee was successfully created." }
        format.json { render :show, status: :created, location: @employee }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @employee.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /employees/1 or /employees/1.json
  def update
    respond_to do |format|
      if @employee.update(employee_params)
        format.html { redirect_to @employee, notice: "Employee was successfully updated." }
        format.json { render :show, status: :ok, location: @employee }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @employee.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /employees/1 or /employees/1.json
  def destroy
    @employee.destroy
    respond_to do |format|
      format.html { redirect_to employees_url, notice: "Employee was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def correct_user
    @employee = current_user.employees.find_by(id: params[:id])
    redirect_to employees_path, notice: "Not authorized to edit this employee" if @employee.nil?
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_employee
      @employee = Employee.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def employee_params
      params.require(:employee).permit(:first_name, :last_name, :phone, :user_id)
    end
end