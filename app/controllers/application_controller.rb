class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception, except: :pastedImages

  helper_method :student_logged_in?, :require_student_login, :current_student, :teacher_logged_in?, :require_teacher_login, :current_teacher, :require_login
  def student_logged_in?
    current_student
  end

  def require_student_login
    unless student_logged_in?
      flash[:alert] = "You need to be logged in as a student to Access This Section"
      redirect_to new_students_session_path
    end
  end

  def require_login
    unless student_logged_in? || teacher_logged_in?
      redirect_to root_path
    end
  end

  def current_student
    @current_student ||= Student.find(session[:student_id]) if session[:student_id]
  end


  def teacher_logged_in?
    current_teacher
  end

  def require__teacher_login
    unless teacher_logged_in?
      flash[:alert] = "You need to be logged in as a student to Access This Section"
      redirect_to new_teacher_session_path
    end
  end

  def current_teacher
    @teacher_student ||= Teacher.find(session[:teacher_id]) if session[:teacher_id]
  end

end
