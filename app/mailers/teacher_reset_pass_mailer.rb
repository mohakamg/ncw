class TeacherResetPassMailer < ApplicationMailer

  default :from => "naughtycollegeworks@gmail.com"

  def teacher_forgot_pass(teacher)
      @teacher = teacher
      mail(to: "#{teacher.first_name} <#{teacher.email}>", subject: "Reset Password Link")
  end

end
