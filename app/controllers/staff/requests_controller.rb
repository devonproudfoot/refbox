class Staff::RequestsController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_staff
  helper_method :current_request

  def index
    @requests = Request.all.paginate(page: params[:page], per_page: 10).order(created_at: :desc)

    respond_to do |format|
      format.html
      format.csv { send_data @requests.export_requests, filename: "completed_requests-#{Date.today.strftime('%Y%d%m')}.csv"}
    end
  end

  def edit
  end

  def update
    current_request.update_attributes(request_params)
    redirect_to current_request 
    flash[:notice] = "Update completed!"

    #need to validate updates!
  end

end
