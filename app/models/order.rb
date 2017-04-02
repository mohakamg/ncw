class Order < ApplicationRecord
  belongs_to :student
  belongs_to :teacher

  mount_uploaders :stud_docs, StudDocUploader
  mount_uploaders :teacher_docs, TeacherDocsUploader
  #process_in_background :stud_docs

  validates :order_type, presence: true, on: :create
  validates :subject, presence: true, on: :create
  validates :topic, presence: true, on: :create

  def paypal_url(return_path)
    values = {
        business: "merchant-testncw@gmail.com",
        cmd: "_xclick",
        upload: 1,
        return: "#{Rails.application.secrets.app_host}#{return_path}",
        invoice: id,
        amount: order.price,
        item_name: order.order_type,
        item_number: order.id,
        quantity: '1',
        notify_url: "#{Rails.application.secrets.app_host}/hook"
    }
    "#{Rails.application.secrets.paypal_host}/cgi-bin/webscr?" + values.to_query
  end

end
