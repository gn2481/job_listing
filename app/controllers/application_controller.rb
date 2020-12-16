class ApplicationController < ActionController::Base
  def require_is_admin
    if !current_user.admin?
      redirect_to root_path, alert: "You are not admin !"
    end
  end
end
