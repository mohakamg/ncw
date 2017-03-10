class TeachersController < ApplicationController

  before_action :check_teacher_login, except: [:index, :show]

  def index
    @teachers = Teacher.all
  end

  def new
    @teacher = Teacher.new
  end

  def create
    @teacher = Teacher.new(create_teacher_params)
    if @teacher.save
      TeacherMailer.registeration_confirmation(@teacher).deliver_now
      flash[:success] = "Welcome to Our World Changing Database! Verify to Continue your Journey"
      redirect_to root_path
    else
      flash[:alert] = "Some Problems Prevented Your Entry. Please Contact Administrator, if Problems Persist"
      render :new
    end
  end

  def show
    @teacher = Teacher.find(params[:id])
    if teacher_logged_in?
      if session[:teacher_id] != @teacher.id
        flash[:alert] = "No Sneaking Into Another Account"
        redirect_to current_teacher
      end
    end
  end

  def edit
    @teacher = Teacher.find(params[:id])
  end

  def update
    @teacher = Teacher.find(params[:id])
    old_pass = params[:teacher][:old_pass]
    if old_pass
      if @teacher.authenticate(old_pass)
        if @teacher.update(create_teacher_params)
          flash[:success] = "Success, Mr. Teacher"
          redirect_to @teacher
        else
          flash[:notice] = "Some Technical Errors Occured!! Please Try Again. If Problem Persists, contact Administrator!!!"
          render :edit
        end
      else
        flash[:notice] = "Old Pass is Incorrect"
        redirect_to edit_teacher_path
      end
    else
      flash[:notice] = "Please Enter the Old Password as Well"
      redirect_to edit_teacher_path
    end
  end

  def confirm_email
    teacher = Teacher.find_by_email_confirm_token(params[:id])
    if teacher
      teacher.email_activate
      params[:success] = "Your Email Has Been Confirmed. Please LogIn To Continue"
      redirect_to new_teacher_session_path
    else
      params[:alert] = "Error! Teacher Does Not Exist. Please Sign Up"
      redirect_to new_teacher_path
    end
  end


  private

  def create_teacher_params
    params.require(:teacher).permit(:first_name, :last_name, :email, :phone, :country, :password, :password_confirmation, :country, :gender, :acceptance_of_terms, :status, :about, :whyme)
  end

  def check_teacher_login
    if student_logged_in?
      flash[:alert] = "You ain't yet teaching Bro!"
      redirect_to root_path
    end
  end

end
