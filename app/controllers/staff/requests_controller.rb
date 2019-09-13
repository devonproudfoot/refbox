class Staff::RequestsController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_staff
  helper_method :current_request

  def index
    @requests = Request.all
  end

  def edit
  end

  def update
    current_request.update_attributes(request_params)
    # not updating?
  end

end
