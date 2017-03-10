class Teacher < ApplicationRecord

      has_secure_password

      before_create :confirmation_token

      validates :first_name, presence: true
      validates :last_name, presence: true
      validates :email, presence: true, uniqueness:true, format: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/
      validates :phone, presence: true, uniqueness:true, length: {maximum: 10, minimum: 10}
      validates :password, presence: true, on: :create
      validates :password_confirmation, presence: true, on: :create
      #validates :password, presence: true, on: :update, allow_blank: true
      #validates :password_confirmation, presence: true, on: :update, allow_blank: true
      validates :status, length: {maximum: 140}
      validates :country, presence: true
      validates :gender, presence: true
      validates :acceptance_of_terms, acceptance: true

      has_many :orders
      has_many :students, through: :orders


  def email_activate
      self.email_confirmed = true
      self.email_confirm_token = nil
      save!(validate: false)
  end

private
  def confirmation_token
    if self.email_confirm_token.blank?
      self.email_confirm_token = SecureRandom.urlsafe_base64.to_s
    end
  end

end
