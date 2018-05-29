class Api::V1::LoadsController < ApplicationController
  before_action :require_login

  def show_load
    load = Load.find(params[:id])
    render json: load.reload, status: :ok
  end

  def create_load
    load = Load.new(load_params)

    if load.save
      render json: load.reload, status: :ok
    else
      render json: load.errors, status: :bad_request
    end
  end

  def update_load
    load = Load.find(params[:id])
    if load.update_attributes(load_params)
      render json: load.reload, status: :ok
    else
      render json: load.errors, status: :bad_request
    end
  end

  private

  def loads_params
    params.permit(:amount_loaded, :remaining_load)
  end
end
