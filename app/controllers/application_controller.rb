class ApplicationController < ActionController::Base

  private

  def authorize
    unless current_user.admin?
      flash[:notice] = "You don't have access to this page"
      redirect_to root_path
      false
    end
  end
end
