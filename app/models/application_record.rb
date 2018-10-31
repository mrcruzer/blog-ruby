class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  include PermissionsConcern


  #metodos para verificar si esta logueado
  protected
  def authenticate_editor!
    redirect_to root_path unless user_signed_in? && current_user.is_editor?
  end

  def authenticate_admin!
    redirect_to root_path unless user_signed_in? && current_user.is_admin?
  end

end
