class Staff::RequestsController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_staff

  def index
    @requests = Request.all
  end

end
