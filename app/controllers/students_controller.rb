class StudentsController < ApplicationController

  before_action :require__student_login, only: :show
  before_action :check_login, except: :show

  def new
    @student = Student.new
  end

  def create
    if Student.find_by_username(params[:student][:username])
      flash[:notice] = "You Already Exist Here! Please LogIn! If you forgot your password, there is no way to recover it!!!!"
      redirect_to new_students_session_path
    else
      @student = Student.new(stud_create_params)
      if @student.save
        session[:student_id] = @student.id
        flash[:success] = "Welcome! You have Succesfully Registered to our Super Secret Database. GO GET WORK DONE!"
        redirect_to @student
      else
        flash[:notice] = "Sorry! We Could Not Save You To Our Database. Please Contact The Administrator!"
        render :new
      end
    end
  end

  def show

  end

  private
  def stud_create_params
    params.require(:student).permit(:username,:password,:password_confirmation, :acceptance_of_terms)
  end

  def check_login
    if student_logged_in?
      flash[:notice] = "You Are Already logged In!"
      redirect_to root_path
    end
  end
end
