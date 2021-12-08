class EmployeesController < ApplicationController
  before_action :set_employee, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :current_user, only: [:edit, :update, :destroy]

  # GET /employees or /employees.json
  def index

    #Check if params are being passed
    if params[:start_time].present? && params[:end_time].present?
      #Convert string params to DateTime and format for comparison
      start_time = params[:start_time].to_datetime.strftime("%F %T UTC")
      end_time = params[:end_time].to_datetime.strftime("%F %T UTC")

      #Outer join employees with busies to display available employees
      @employees = Employee.joins("left join busies 
                                  on busies.employee_id = employees.id"
                                  ).where("busies.id is null 
                                  and (busies.start_time not between '#{start_time}' and '#{end_time}'
                                  or busies.end_time not between '#{start_time}' and '#{end_time}') 
                                  or busies.id is null")                   
      
      #If there are no resulting employees/none to begin with, notice
      if @employees.nil?
        flash.now[:notice] = "There are no employees available for your selected shift."

      else
        flash.now[:notice] = "Employees available for your shift are listed below."
      end
    #If no params are passed in - just standard employee/index page
    else
      @employees = Employee.all
    end
  end

  # GET /employees/1 or /employees/1.json
  def show
  end

  # GET /employees/new
  def new
    @employee = current_user.employees.build
  end

  # GET /employees/1/edit
  def edit
  end

  # POST /employees or /employees.json
  def create
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