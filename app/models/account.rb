class Account < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  has_many :images

  has_many :comments, dependent: :destroy

  has_many :comments, through: :image

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [google_oauth2]

  def self.create_from_provider_data(provider_data)
    where(provider: provider_data.provider, uid: provider_data.uid).first_or_create do |account|
      account.email = provider_data.info.email
      account.password = Devise.friendly_token[0, 20]
    end
  end

  # validates :username, presence: true, uniqueness: { case_sensitive: false }
  # validates :first_name, presence: true
  # validates :last_name, presence: true

  # def full_name
  #   [first_name, last_name].join(' ')
  # end

end
