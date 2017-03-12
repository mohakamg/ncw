class Order < ApplicationRecord
  belongs_to :student
  belongs_to :teacher

  mount_uploaders :stud_docs, StudDocUploader
  mount_uploaders :teacher_docs, TeacherDocsUploader
  #process_in_background :stud_docs

  validates :order_type, presence: true, on: :create
  validates :subject, presence: true, on: :create
  validates :topic, presence: true, on: :create



end
