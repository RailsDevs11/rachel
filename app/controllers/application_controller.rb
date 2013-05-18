class ApplicationController < ActionController::Base
  protect_from_forgery

  private

  def after_sign_in_path_for(resource)
    if resource.is_a?(Customer)
      return customer_dashboard_index_path
    end
  end

  def after_update_path_for(resource)
    if resource.is_a?(Customer)
      return customer_dashboard_index_path
    end
  end

end
