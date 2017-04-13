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
    if cookies['timezone']
      Time.zone = cookies['timezone']
    end
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
        @teacher.assign_attributes(create_teacher_params)
        @teacher.profile_pic = params[:teacher][:pic] if params[:teacher][:pic]
        if @teacher.save
          flash[:success] = "Success, Mr. Teacher"
          redirect_to @teacher
        else
          flash[:notice] = "Some Technical Errors Occured!! Please Try Again. If Problem Persists, contact Administrator!!!"
          render :edit
        end
      else
        flash[:notice] = "Old Pass is Incorrect"
        render :edit
      end
    else
      flash[:notice] = "Please Enter the Old Password as Well"
      render :edit
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

  def reset_pass

  end

  def reset_pass_mail
    teacher = Teacher.find_by_email(params[:email])
    if !teacher
      flash[:alert] = "You Dont Exist In Our Database. Please SignUp Instead"
      redirect_to new_teacher_path
    else
      teacher.reset_token
      TeacherResetPassMailer.teacher_forgot_pass(teacher).deliver_now
      flash[:success] = "Reset Password Link has been sent successfully!!!"
      redirect_to root_path
    end
  end

  def reset_password_link
    @teacher = Teacher.find_by_email_confirm_token(params[:token])
  end

  def reset_password
    teacher = Teacher.find(params[:id])
    teacher.password = params[:password]
    teacher.email_confirm_token = nil
    if teacher.save!
      flash[:success] = "Password Successfully Updated Mr. Teacher. Please Login To Continue"
      redirect_to new_teacher_session_path
    else
      flash[:alert] = "Some Error Occured. Please Contact Administrator"
      redirect_to root_path
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
