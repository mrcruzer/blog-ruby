Rails.application.routes.draw do

  #rutas para el search
  get 'articles/search'

  resources :categories
  resources :articles
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'articles#index'
  # ruta que cargara por defecto

    
  post 'contacts/new'
  
  get 'welcome/contactos'


  #Ruta para formulario contactos
  resources :contacts, only: [:create, :new]

  # Rutas para Iniciar sesion y Registrarse
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: "users/registrations",
    passwords: "users/passwords",
  }


end
