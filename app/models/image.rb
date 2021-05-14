class Image < ApplicationRecord
    #   %?%  looks for everything similar to the query

    has_one_attached :image

    has_many :likes, dependent: :destroy

    has_many :accounts_who_liked, through: :likes, source: :account

    belongs_to :account
    
    def self.search(query)
        self.where("title like %?%", query)
    end

    def uploaded_at
        self.created_at.to_date
    end

    def self.most_recent
        self.order(created_at: :asc)
    end

    #default_scope { order(created_at: :desc)}

    #validates :image, attached: true, content_type: %w(image/jpg image/jpeg image/png)
end
