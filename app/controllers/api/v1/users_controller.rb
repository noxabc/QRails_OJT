class Api::V1::UsersController < ApplicationController

  def create_user
    user = User.new(users_params)
    if user.save
      render json: { status: 'Success', data:user }, status: :ok
    else
      render json: user.errors, status: :bad_request
    end
  end

  def update_user
    @current_user = User.find(params[:id])
    if @current_user.update_attributes(users_params)
      render json: @current_user.reload, status: :ok
    else
      render json: @current_user.errors, status: :bad_request
    end
  end

  private

  def users_params
    params.permit(:last_name, :first_name, :middle_name, :username, :password, :password_confirmation, :mobile_number)
  end
end
