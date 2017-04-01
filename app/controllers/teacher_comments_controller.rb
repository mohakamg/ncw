class TeacherCommentsController < ApplicationController

  before_action :must_be_student

  def create
    teacher = Teacher.find(params[:teacher_id])
    cur_stud = current_student
    comment_body = params[:teacher_comment][:comment]
    if !comment_body
      flash[:notice] = "Comment Can't be blank"
      redirect_to :back
    end
    @teacher_comment = teacher.teacher_comments.new(comment: comment_body)
    @teacher_comment.student = cur_stud
    if @teacher_comment.save!
      respond_to do |format|
        format.html {redirect_to teacher}
        format.js
      end
    end
  end

  private

  def must_be_student
    if !student_logged_in?
      flash[:alert] = "You need to login to leave a comment."
      redirect_to new_students_session_path
    else
      unless Teacher.find(params[:teacher_id]).students.find(current_student.id)
        flash[:notice] = "This Teacher never taught you. You cannot leave a comment"
        redirect_to root_path
      end
    end
  end

end
