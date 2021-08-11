class ApplicationController < ActionController::Base
  before_action :set_nav_pages

  def set_nav_pages
    @nav_pages = Page.where(is_in_nav: true)
  end

  def after_sign_in_path_for(_resource_or_scope)
    dashboard_path
  end

  def after_sign_out_path_for(_resource_or_scope)
    root_path
  end

  def not_found
    fail ActionController::RoutingError, 'Not Found'
  end

  def authenticate_admin!
    authenticate_user!
    unless current_user.admin?
      redirect_to root_path, notice: "You can't go there without being an Admin."
    end
  end
end
