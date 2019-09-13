class ApplicationController < ActionController::Base

  private

  def current_request
    @request = Request.find_by_id(params[:id])
  end

  def request_params
    params.require(:request).permit(:identifier, :title, :creator, :item_number, :status)
  end

  def authenticate_staff
    unless current_user.spco_staff
      render plain: 'Unauthorized', status: :unauthorized
    end
  end
end
