class ApplicationController < ActionController::Base
protect_from_forgery with: :exception, prepend: true

    add_flash_types :danger, :info, :warning, :success

    before_action :cargar

    def cargar
        @categories = Category.all
    end

     protected
  def authenticate_editor!
    redirect_to root_path, danger: "No tienes permisos para realizar esta accion" unless user_signed_in? && current_user.is_editor?
  end

  def authenticate_admin!
    redirect_to root_path, notice: "No tienes permisos para realizar esta accion" unless user_signed_in? && current_user.is_admin?
  end
    
end
