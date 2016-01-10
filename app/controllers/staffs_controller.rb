class StaffsController < ApplicationController
  def index
    @staff = Staff.all
    @current_staff = current_staff
  end

  def new
    @staff = Staff.new
  end

  def create
    @staff = Staff.create(staff_params)
    if @staff.save
      flash[:notice] = "Your account has been created."
      redirect_to staffs_path
    else
      flash[:alert] = "There was a problem saving your account."
      redirect_to staffs_path_new
    end
  end

  def edit

  end

  def update
  end

  def show
  end

  def destroy

  end

  private   

# this provdes additional security by only allowing the permitted variables to be accessed and changed.

  def staff_params
    params.require(:staff).permit(:id, :fname, :lname, :email, :password, :job_title)
  end

end
