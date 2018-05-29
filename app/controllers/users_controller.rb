class UsersController < ApplicationController
  layout 'admin'

  def view_user
    @user = User.all
  end

  private

  def users_params
    params.permit(:last_name, :first_name, :middle_name, :username, :password, :password_confirmation, :mobile_number)
  end
end
