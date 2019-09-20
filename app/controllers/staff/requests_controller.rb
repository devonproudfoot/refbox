class Staff::RequestsController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_staff
  helper_method :current_request

  def index
    if params[:commit]
      gather_requests = Request.where({params[:search_type] => params[:q]})
    else
      gather_requests = Request.all
    end

    @requests = gather_requests.paginate(page: params[:page], per_page: 10).order(created_at: :desc)

    respond_to do |format|
      format.html
      format.csv { send_data @requests.export_requests, filename: "completed_requests-#{Date.today.strftime('%Y%d%m')}.csv"}
    end
  end

  def edit
    return render_not_found if current_request.blank?
  end

  def update
    current_request.update_attributes(request_params)
    return render_not_found if current_request.blank?
    if current_request.valid?
      redirect_to current_request 
      flash[:notice] = "Update completed!"
    else
      render :edit, status: :unprocessable_entity
    end
  end

end
