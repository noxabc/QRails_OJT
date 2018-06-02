class Api::V1::SessionsController < ApplicationController
  skip_before_action :require_login, only: [:authenticate_user], raise: false

  def authenticate_user
    if user = User.valid_login?(params[:username], params[:password])
      user.password_confirmation = params[:password]
      user.password = params[:password]
      # user.regenerate_auth_token
      render json: { status: 'Success', data:user }, status: :ok
    else
      render json: { error: "Wrong email or password" }, status: :unauthorized
    end
  end

  def logout_user
    p current_user
    current_user.invalidate_token
    head :ok
  end

  private

  def users_params
    params.permit(:last_name, :first_name, :middle_name, :username, :password, :password_confirmation, :mobile_number)
  end
end
