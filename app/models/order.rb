class Order < ApplicationRecord
  belongs_to :student
  belongs_to :teacher

  validates :order_type, presence: true, on: :create
  validates :subject, presence: true, on: :create
  validates :topic, presence: true, on: :create

end
