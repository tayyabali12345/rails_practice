# frozen_string_literal: true

class ApplicationController < ActionController::Base
  rescue_from ActiveRecord::RecordNotFound, with: :not_found
  before_action :authenticate_user!
  include ApplicationHelper
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[image first_name last_name user_type])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[image first_name last_name user_type])
  end

  def not_found
    flash['alert'] = t('alert')
    redirect_to root_path
  end
end
