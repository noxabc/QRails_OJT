class Api::V1::TransportFaresController < ApplicationController
  before_action :require_login

  def index
    transportfares = TransportFare.order('created_at ASC');
    render json: transportfares.reload, status: :ok
  end

  def show
    transportfare = TransportFare.find(params[:id])
    render json: transportfare.reload, status: :ok
  end

  def update
    transportfare = TransportFare.find(params[:id])
    if transportfare.update_attributes(transportfares_params)
      render json: transportfare.reload, status: :ok
    else
      render json: transportfare.errors, status: :bad_request
    end
  end

  private

  def transportfares_params
    params.permit(:pickup_location, :drop_location, :trip_amount)
  end
end
