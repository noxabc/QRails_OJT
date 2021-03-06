class Api::V1::TripTransactionsController < ApplicationController
  # before_action :require_login

  def index
    triptransactions = TripTransaction.order('created_at DESC');
    render json: triptransactions.reload, status: :ok
  end

  def show_transaction
    triptransaction = TripTransaction.find(params[:id])
    render json: triptransaction.reload, status: :ok
  end

  def create_transaction
    triptransaction = TripTransaction.new(triptransactions_params)
    if triptransaction.save
      render json: triptransaction.reload, status: :ok
    else
      render json: triptransaction.errors, status: :bad_request
    end
  end

  private

  def triptransactions_params
    params.permit(:pickup_location, :drop_location, :trip_amount, :user_id, :transport_fare_id)
  end
end
