class Article < ApplicationRecord

belongs_to :user
    # articulos pertenece a usuario

    validates :title, uniqueness: true

    validates :title, :body, presence: true
    validates :title, length: { in: 5..10 }
    validates :body, length: { minimum: 25}
end
