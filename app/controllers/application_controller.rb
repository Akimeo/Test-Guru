# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    resource.is_a?(Admin) ? admin_tests_path : root_path
  end

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])
  end
end
