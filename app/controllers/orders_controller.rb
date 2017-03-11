class OrdersController < ApplicationController

  before_action :require_login
  before_action :require_student_login, only: [:new, :create]

  def index
  end

  def show
    @student = Student.find(params[:student_id])
    @order = Order.find(params[:id])
  end

  def new
    @student = Student.find(params[:student_id])
    @order = @student.orders.new
  end

  def create
    @student = Student.find(params[:student_id])
    @order = @student.orders.new(create_order_student_params)
    @order.teacher_id = 0
    if @order.save
      flash[:success] = "Order Placed. Have a wonderful time!!!"
      redirect_to @student
    else
      flash[:notice] = "Not Created"
      render :new
    end

  end

  def update
    student = Student.find(params[:student_id])
    order = Order.find(params[:id])

    docs = order.stud_docs

    if params[:order][:stud_docs]
      docs += params[:order][:stud_docs]
    end
    
    order.stud_docs = docs

    order.about_homework = params[:order][:about_homework]

    order.website = params[:order][:website]

    order.credentials = params[:order][:credentials]

    order.special_comments = params[:order][:special_comments]

    order.approved_completion = params[:order][:approved_completion]

    if order.save
      flash[:success] = "Order Updated Successfully. Have a wonderful time!!!"
      redirect_to student_order_path(student, order)
    else
      flash[:notice] = "Not Created"
      render :show
    end
  end

  private

  def create_order_student_params
    params.require(:order).permit(:student_id, :order_type, :special_comments, :deadline, :approved_completion, :website, :credentials, :subject, :topic, :about_homework, {stud_docs: []})
  end

  def create_order_teacher_params
    params.require(:order).permit(:teacher_id, order_attributes[:status])
  end

end
