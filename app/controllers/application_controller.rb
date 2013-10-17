class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def after_sign_in_path_for(resource)
    if resource.sign_in_count == 1 && resource.client
      terms_conditions_path(resource.client.id)
    elsif resource.client
      request.env['omniauth.origin'] || stored_location_for(resource) || root_path
    else
      clients_path
    end
  end
  
end
