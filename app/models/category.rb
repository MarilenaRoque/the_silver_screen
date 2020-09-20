class Category < ApplicationRecord
    has_and_belongs_to_many :articles, class_name: "Article"
    validates :name, presence: true
    validates :priority, presence: true

    
end
