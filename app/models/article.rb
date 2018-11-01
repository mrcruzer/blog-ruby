class Article < ApplicationRecord

    include PermissionsConcern


    has_many :has_categories
    has_many :categories, through: :has_categories



    belongs_to :user, optional: true
        # articulos pertenece a usuario

    after_create :save_categories


        # validaciones
    validates :title, uniqueness: true
    validates :title, :body, presence: true
    validates :title, length: { in: 5..15 }
    validates :body, length: { minimum: 25}

    def categories=(value)
        @categories = value

        # raise @categories.to_yaml
    end

    private
        def save_categories
            @categories.each do | category_id |
                HasCategory.create(category_id: category_id, article_id: self.id)
            end
        end
end
