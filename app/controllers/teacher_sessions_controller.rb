class TeacherSessionsController < ApplicationController

  before_action :check_student_login, except: [:destroy]
  before_action :email_verified?, only: [:create]

  def new
  end

  def create
    email = params[:email]
    if email
      if Teacher.find_by_email(email)
        if params[:password]
          teacher = Teacher.find_by_email(email)
          if teacher.authenticate(params[:password])
            if teacher.email_confirmed
              session[:teacher_id] = teacher.id
              flash[:success] = "Access Granted Mr. Teacher. Welcome!"
              redirect_to teacher
            else
              flash[:notice] = "Nah! Nah! Activate Your Account First..."
              redirect_to new_teacher_path
            end
          else
            flash[:notice] = "Incorrect!! Password"
            redirect_to new_teacher_session_path
          end
        else
          flash[:notice] = "Password Cannot Be Blank!!"
          redirect_to new_teacher_path
        end
      else
        flash[:notice] = "You Dont Exist In Our Database. Sign Up Instead?"
        redirect_to new_teacher_path
      end
    else
      flash[:notice] = "Email Cannot Be Blank!!"
      redirect_to new_teacher_path
    end
  end

  def destroy
    if teacher_logged_in?
      session[:teacher_id] = nil
      flash[:success] = "GoodBye! MR. Teahcer"
      redirect_to root_path
    end
  end

  private

  def check_student_login
    if student_logged_in?
      flash[:alert] = "You ain't logged in as a student"
      redirect_to root_path
    end
  end

  def email_verified?
    unless Teacher.find_by_email(params[:email]).email_confirmed
      flash[:alert] = "Please Verify Your Email First!!"
      redirect_to root_path
    end
  end

end
