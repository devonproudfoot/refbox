class ApplicationController < ActionController::Base

  private

  
  
  def request_params
    params.require(:request).permit(:identifier, :title, :creator, :item_number)
  end

  def authenticate_staff
    unless current_user.spco_staff
      render plain: 'Unauthorized', status: :unauthorized
    end
  end
end
