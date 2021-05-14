class Account < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  has_many :images

  has_many :likes, dependent: :destroy

  has_many :liked_images, through: :likes, source: :image

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # validates :username, presence: true, uniqueness: { case_sensitive: false }
  # validates :first_name, presence: true
  # validates :last_name, presence: true

  # def full_name
  #   [first_name, last_name].join(' ')
  # end

end
