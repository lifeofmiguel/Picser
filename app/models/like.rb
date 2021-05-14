class Like < ApplicationRecord
    
    belongs_to :account

    belongs_to :image

    validates :user_id, uniqueness: {scope: :photo_id}
    
end