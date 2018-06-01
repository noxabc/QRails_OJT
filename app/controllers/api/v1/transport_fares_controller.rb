class Api::V1::TransportFaresController < ApplicationController
  before_action :require_login

  def show_transport_fare
    transportfares = TransportFare.order('created_at ASC');
    render json: transportfares.reload, status: :ok
  end

  def get_transport_fare
    transportfare = TransportFare.find(params[:id])
    render json: transportfare.reload, status: :ok
  end

  # def update_transport_fare
  #   transportfare = TransportFare.find(params[:id])
  #   if transportfare.update_attributes(transportfares_params)
  #     render json: transportfare.reload, status: :ok
  #   else
  #     render json: transportfare.errors, status: :bad_request
  #   end
  # end

  def compare_location
    if transportfare = TransportFare.where("pickup_location = ? AND drop_location = ?", params[:pickup_location], params[:drop_location]).first
      render json: { status: 'Success', data:transportfare.trip_amount}, status: :ok
    else
      render json: load.errors, status: :unauthorized
    end
  end

  private

  def transportfares_params
    params.permit(:pickup_location, :drop_location, :trip_amount)
  end
end
