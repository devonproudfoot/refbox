class RequestsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :show]

  def new
    @request = Request.new
  end

  def create
    @request = current_user.requests.create(request_params)

    if @request.valid?
      redirect_to request_path(@request)
      flash[:notice] = "Request successfully created! A SPCO staff member will let you know when your item is availible!"
    else
      render :new, status: :unprocessable_entity
    end

  end

  def show
    @request = Request.find_by_id(params[:id])
  end

  private

  def request_params
    params.require(:request).permit(:identifier, :title, :creator, :item_number)
  end

end
