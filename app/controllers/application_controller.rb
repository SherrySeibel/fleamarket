class ApplicationController < ActionController::Base
  include Monban::ControllerHelpers
  
  protect_from_forgery with: :exception
  before_action :require_login
  
  def require_admin
    if ! current_user.admin
      redirect_to :root
    end
  end
end
