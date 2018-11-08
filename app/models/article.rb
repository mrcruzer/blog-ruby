class Article < ApplicationRecord

    mount_uploader :images, ImagesUploader

    include PermissionsConcern


    has_many :has_categories
    has_many :categories, through: :has_categories, dependent: :destroy



    belongs_to :user, optional: true
        # articulos pertenece a usuario

    after_create :save_categories


        # validaciones
    validates :title, uniqueness: true
    validates :title, :body, presence: true
    validates :title, length: { maximum: 25}
    validates :body, length: { minimum: 25}

    #Scopes, Son busquedas en query, se usan en el controlador
    scope :ultimos, -> {order("created_at DESC")}
    # Ex:- scope :active, -> {where(:active => true)}

    scope :titulo, -> (title) { where("title LIKE ?", "#{title}%") }

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
