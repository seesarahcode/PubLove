class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :configure_devise_permitted_parameters, if: :devise_controller?
  before_action :find_current_publisher, if: :user_signed_in?

  def index
  end

  protected

    def configure_devise_permitted_parameters
      registration_params = [:email, :password, :password_confirmation, :role]
      if params[:action] == 'create'
        devise_parameter_sanitizer.for(:sign_up) { 
          |u| u.permit(registration_params) 
        }
      end
    end

    def after_sign_in_path_for(resource)
      case current_user.role
      when "super_admin"
        super_admin_dashboard_path
      when "admin"
        admin_dashboard_path
      when "project_manager"
        pm_dashboard_path
      when "author"
        author_dashboard_path
      end
    end

    def find_current_publisher
      @publisher = Publisher.find(current_user.publisher_id)
    end

end
