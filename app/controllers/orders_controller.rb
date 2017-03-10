class OrdersController < ApplicationController

  before_action :require_login
  before_action :require_student_login, only: [:new, :create]

  def index
  end

  def show
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

  def edit
  end

  def update
  end

  private

  def create_order_student_params
    params.require(:order).permit(:student_id, :order_type, :special_comments, :deadline, :approved_confirmation, :website, :credentials, :subject, :topic, :about_homework)
  end

  def create_order_teacher_params
    params.require(:order).permit(:teacher_id, order_attributes[:status])
  end

end
