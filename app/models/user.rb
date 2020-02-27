class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable #, :validatable

  belongs_to :raffle, required: true 

  validates :email, presence: true
  validates :email, format: { with: Devise.email_regexp }
  validates :email, uniqueness: { scope: :raffle_id,
    message: "registerable once per raffle" }

  validates :password, confirmation: true, on: :create
  validates :password, :password_confirmation, presence: true, on: :create

  validates :password, length: { in: Devise.password_length }

  def win_raffle_percentage
    100 / User.where(raffle_id: raffle_id).count
  end  
end
