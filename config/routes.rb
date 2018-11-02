Rails.application.routes.draw do

  get 'articles/search'

  devise_for :users
  resources :categories
  resources :articles
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'articles#index'
  # ruta que cargara por defecto
  
  get 'welcome/contactos'


end
