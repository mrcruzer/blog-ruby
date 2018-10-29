class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

  has_many :articles
    # Un usuario tiene muchos articulos

  has_many :categories
end
