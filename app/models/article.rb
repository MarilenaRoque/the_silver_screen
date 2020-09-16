class Article < ApplicationRecord
    belongs_to :author, class_name: "User"
    has_one_attached :image
    has_and_belongs_to_many :categories, class_name: "Category"
end