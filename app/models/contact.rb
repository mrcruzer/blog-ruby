class Contact < ApplicationRecord
    validates :email, :name, :description, presence: true

    
end
