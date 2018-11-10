Rails.application.routes.draw do

  
  #rutas para el search
  get 'articles/search'

  resources :categories

  # Crea una padre e hijo
  resources :articles do
    resources :comments
  end

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
