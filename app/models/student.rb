class Student < ApplicationRecord

  has_secure_password

  validates :username, presence: true, uniqueness: true, length: {minimum: 4, maximum: 18}
  validates :password_digest, presence: true
  validates :acceptance_of_terms, acceptance: true
  validates :password_confirmation, presence: true, on: :create

  has_many :orders
  has_many :teachers, through: :orders

end
