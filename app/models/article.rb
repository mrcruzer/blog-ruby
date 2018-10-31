class Article < ApplicationRecord

    has_many :has_categories
    has_many :categories, through: :has_categories


    belongs_to :user
        # articulos pertenece a usuario

        # validaciones
    validates :title, uniqueness: true
    validates :title, :body, presence: true
    validates :title, length: { in: 5..10 }
    validates :body, length: { minimum: 25}
end
