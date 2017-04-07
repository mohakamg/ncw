class StudentsSessionsController < ApplicationController


  before_action :check_login, except: [:destroy]
  before_action :check_teacher_login, except: [:destroy]

  def new
  end


  def create
    @student = Student.find_by_username(params[:username])
    if @student
      if params[:password]
        if @student.authenticate(params[:password])
          session[:student_id] = @student.id
          flash[:success] = "Welcome! GO NAIL IT!"
          redirect_to @student
        else
          flash[:notice] = "Nah Nah!!!! Incorrect Password...."
          render :new
        end
      else
        flash[:alert] = "Please Fill Out all the Fields!!"
        render :new
      end
    else
      flash[:notice] = "Your Anonymous Identity Does not Exist in Our Database."
      render :new
    end
  end

  def destroy
    if student_logged_in?
      session[:student_id] = nil
      flash[:success] = "Successfully Logged Out!"
      redirect_to new_students_session_path
    end
  end

  protect_from_forgery except: [:login_mobile_student]
  def login_mobile_student
    username = params[:username]
    password = params[:password]
    if Student.find_by_username(username) && Student.find_by_username(username).authenticate(password)
      student = Student.find_by_username(username)
      token = SecureRandom.hex(10)
      student.token = token
      student.save!
      respond_to do |f|
        f.json {render json: {id: student.id, username: student.username, token: student.token}.to_json}
      end
    end
  end

  private

  def check_login
    if student_logged_in?
      flash[:notice] = "You Are Already logged In!"
      redirect_to root_path
    end
  end

  def check_teacher_login
    if teacher_logged_in?
      flash[:alert] = "You ain't logged in as a student"
      redirect_to root_path
    end
  end

end
