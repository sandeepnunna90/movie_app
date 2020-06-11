class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :email, presence: :true
  validates :password, presence: :true
  validates :admin, inclusion: { in: [true, false] }

  has_many :reviews, dependent: :destroy


  def admin?
    admin
  end

  def username
    email[/^[^@]+/]
  end
end
