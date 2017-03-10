class TeacherMailer < ActionMailer::Base

  default :from => "naughtycollegeworks@gmail.com"

  def registeration_confirmation(teacher)
    @teacher = teacher
    mail(to: "#{teacher.first_name} <#{teacher.email}>", subject: "Please Confirm Your Email To Register")
  end

end
