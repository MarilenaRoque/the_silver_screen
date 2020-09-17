class Article < ApplicationRecord
    belongs_to :author, class_name: "User"
    has_one_attached :image
    has_and_belongs_to_many :categories, class_name: "Category"
    validates :categories_list, presence: true


    def categories_list
        categories
    end

    def categories_list=(arr_ids)
        arr_ids.each do |n| 
            self.categories << Category.find(n.to_i)
        end
    end
    
end
