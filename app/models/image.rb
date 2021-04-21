class Image < ApplicationRecord
    #   %?%  looks for everything similar to the query
    def self.search(query)
        self.where("title like %?%", query)
    end

    def uploaded_at
        self.created_at.to_date
    end

    def self.most_recent
        self.order(created_at: :asc)
end
