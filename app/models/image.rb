class Image < ApplicationRecord
    #   %?%  looks for everything similar to the query
    has_one_attached :photo

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

    #validates :image, attached: true, content_type: %w(image/jpg image/jpeg image/png)
end
