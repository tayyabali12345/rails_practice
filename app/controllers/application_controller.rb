# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  include ApplicationHelper
  include Pundit::Authorization
  include Pundit
  before_action :configure_permitted_parameters, if: :devise_controller?

  rescue_from Pundit::NotAuthorizedError do
    redirect_to root_path, alert: 'You are not allowed to access this page'
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[image first_name last_name user_type])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[image first_name last_name user_type])
  end
end
