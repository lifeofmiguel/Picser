class Post < ApplicationRecord
    devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable
end
