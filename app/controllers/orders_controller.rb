class OrdersController < ApplicationController

  before_action :require_login, except: [:hook]
  before_action :require_student_login, only: [:new, :create]
  before_action :require__teacher_login, only: [:accept_order_path]

  def index
  end

  def show
    if student_logged_in?
      @student = Student.find(params[:student_id])
    else
      @teacher = Teacher.find(params[:teacher_id])
    end
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
    if params[:order][:order_type] == "Get Homework Done"
      @order.price = 3
    elsif params[:order][:order_type] == "Homework with Explaination"
      @order.price = 4
    elsif params[:order][:order_type] == "Live Video Tuition"
      @order.price = 5
    end
    if @order.save
      redirect_to @order.paypal_url(student_order_path(@student, @order))
    else
      flash[:notice] = "Not Created"
      render :new
    end
  end

  def update
    if(student_logged_in?)
      student = Student.find(params[:student_id])
      order = Order.find(params[:id])


      if params[:order][:stud_docs]
        docs = order.stud_docs
        docs += params[:order][:stud_docs]
        order.stud_docs = docs
      end


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
    elsif teacher_logged_in?
      teacher = Teacher.find(params[:teacher_id])
      order = Order.find(params[:id])

      if params[:order][:teacher_docs]
        docs = order.teacher_docs
        docs += params[:order][:teacher_docs]
        order.teacher_docs = docs
      end

      order.status = params[:order][:status]
      if order.save
        flash[:success] = "Order Updated Successfully. Have a wonderful time!!!"
        redirect_to teacher_order_path(teacher, order)
      else
        flash[:notice] = "Not Created"
        render :show
      end

    end
  end

  def accept_order_path
    order = Order.find(params[:order_id])
    teacher = Teacher.find(params[:teacher_id])
    order.teacher_id = teacher.id
    order.status = "Accepted. In Progress"
    if order.save
      flash[:success] = "Order Accepted. Go help the kid out!!"
      redirect_to teacher
    else
      flash[:alert] = "Order Acceptance Failed. Please Contact the Administrator"
      redirect_to :back
    end
  end

  def pastedImages
    order = Order.find(params[:order_id])
    order.stud_pasted_images.push(params[:pastedImage])
    if order.save!
      render status: 200
    else
      puts "Failed"
    end
  end

  protect_from_forgery except: [:hook]
  def hook
    status = params[:payment_status]
    if status == "Completed"
      @order = Order.find(params[:item_number])
      parameters = String.new
      params.each do |key, value|
        parameters += key + " = " + value + " | "
      end
      @order.update_attributes(notification_params: parameters, purchase_status: status, transaction_id: params[:txn_id], purchased_at: Time.now)
    end
  end

  private

  def create_order_student_params
    params.require(:order).permit(:student_id, :order_type, :special_comments, :deadline, :approved_completion, :website, :credentials, :subject, :topic, :about_homework, {stud_docs: []}, :price, :notification_params, :purchase_status)
  end

  def create_order_teacher_params
    params.require(:order).permit(:teacher_id, order_attributes[:status])
  end

end
