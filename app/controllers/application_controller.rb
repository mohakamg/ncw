class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :student_logged_in?, :require_student_login, :current_student
  def student_logged_in?
    current_student
  end

  def require__student_login
    unless student_logged_in?
      flash[:alert] = "You need to be logged in as a student to Access This Section"
      redirect_to new_students_session_path
    end
  end

  def current_student
    @current_student ||= Student.find(session[:student_id]) if session[:student_id]
  end

end
