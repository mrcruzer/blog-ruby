class Category < ApplicationRecord



    # tiene muchas ca
    has_many :has_categories
    has_many :articles, through: :has_categories

    belongs_to :user
     # Pertenece a user

     validates :name, :color, presence: true
     validates :name, length: { in: 7..20 }
     validates :color, length: { in: 4..7 }
        # validaciones
end
