class HomeController < ApplicationController

  def home

    if student_logged_in?
      redirect_to student_path(current_student)
    end

    if teacher_logged_in?
      redirect_to teacher_path(current_teacher)
    end

  end

end
