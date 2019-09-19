class Staff::UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_staff

  def index
    @users = User.all

    respond_to do |format|
      format.html
      format.csv { send_data @users.export_users, filename: "users-#{Date.today.strftime('%Y%d%m')}.csv"}
    end
  end

  def show
    @user = User.find_by_id(params[:id])
  end

end
