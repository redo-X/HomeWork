class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # Workaround, aufgrund eines Fehlers im cancan GEM
  before_filter do
    resource = controller_name.singularize.to_sym
    method = "#{resource}_params"
    params[resource] &&= send(method) if respond_to?(method, true)
  end

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message
  end

  before_action :authenticate_user!

end
