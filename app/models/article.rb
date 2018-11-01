class Article < ApplicationRecord

      include PermissionsConcern


    has_many :has_categories
    has_many :categories, through: :has_categories

    after_create :save_categories


    belongs_to :user, optional: true
        # articulos pertenece a usuario

        # validaciones
    validates :title, uniqueness: true
    validates :title, :body, presence: true
    validates :title, length: { in: 5..10 }
    validates :body, length: { minimum: 25}

    def categories=(value)
        @categories = value

        # raise @categories.to_yaml
    end

    private save_categories
        @categories.each do | category_id |
            HasCategory.
        end
    end
end
