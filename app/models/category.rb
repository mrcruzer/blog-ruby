class Category < ApplicationRecord

    mount_uploader :images, ImagesUploader



    # tiene muchos articles
    has_many :has_categories
    has_many :articles, through: :has_categories

    belongs_to :user, optional: true
     # Pertenece a user

     validates :name, :color, presence: true
     validates :name, length: { in: 7..20 }
     validates :color, length: { in: 4..7 }
        # validaciones
end
