class ApplicationController < ActionController::Base
protect_from_forgery with: :exception, prepend: true


  # before_action :authenticate_user!, unless: :no_users?

    add_flash_types :danger, :info, :warning, :success

    # def no_users? User.all.empty? end

     protected
  def authenticate_editor!
    redirect_to root_path, danger: "No tienes permisos para realizar esta accion" unless user_signed_in? && current_user.is_editor?
  end

  def authenticate_admin!
    redirect_to root_path, danger: "No tienes suficiente permisos para realizar esta accion" unless user_signed_in? && current_user.is_admin?
  end
    
end
