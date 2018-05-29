class AdminsController < ApplicationController

  def index
    @user = User.all
    if session[:admin_id]
      render layout: 'admin'
    else
      redirect_to login_path
    end
  end

  def authenticate
    @admin1 = Admin.find_by(username: params[:admin][:username])
    @admin = Admin.new(params.require(:admin).permit(:username, :password))
    if @admin && @admin1.authenticate(params[:admin][:password])
      session[:admin_id] = @admin1.id
      redirect_to '/'
    elsif @admin.username.blank?
      @user = "Please enter username"
      if @admin.password.blank?
        @pass = "Please enter password"
      end
      render 'login'
    elsif @admin.password.blank?
      @pass = "Please enter password"
      render 'login'
    elsif @admin.password.blank?
      @pass = "Please enter password"
      render 'login'
    else
      render 'login'
    end
  end

  def destroy_session
    session[:admin_id] = nil
    redirect_to login_path
  end

  def login
    @admin = Admin.new
    if session[:admin_id]
      redirect_to "/"
    end
  end

  private

  def admins_params
    params.permit(:username, :password, :password_confirmation)
  end
end
