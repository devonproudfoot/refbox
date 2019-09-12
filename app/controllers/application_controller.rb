class ApplicationController < ActionController::Base

  private 

  def authenticate_staff
    unless current_user.spco_staff
      render plain: 'Unauthorized', status: :unauthorized
    end
  end
end
