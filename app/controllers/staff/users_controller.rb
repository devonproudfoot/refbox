class Staff::UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_staff

  def index
    @users = User.all.paginate(page: params[:page], per_page: 10).order(created_at: :desc)

    respond_to do |format|
      format.html
      format.csv { send_data @users.export_users, filename: "users-#{Date.today.strftime('%Y%d%m')}.csv"}
    end
  end

  def show
    @user = User.find_by_id(params[:id])
    render_not_found if @user.blank?
  end

end
