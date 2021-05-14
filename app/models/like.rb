class Like < ApplicationRecord
    
    belongs_to :account

    belongs_to :image

    validates :account_id, uniqueness: {scope: :image_id}

end