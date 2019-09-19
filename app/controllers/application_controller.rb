class ApplicationController < ActionController::Base

  private

  def current_request
    current_request ||= Request.find_by_id(params[:id])
  end

  def request_params
    params.require(:request).permit(:identifier, :title, :creator, :item_number, :status)
  end

  def authenticate_staff
    unless current_user.spco_staff
      render plain: 'Unauthorized', status: :unauthorized
    end
  end

  def render_not_found
    return render plain: "Item not found!", status: :not_found
  end
end
