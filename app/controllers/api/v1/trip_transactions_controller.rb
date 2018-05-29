class Api::V1::TripTransactionsController < ApplicationController
  before_action :require_login

  def index
    triptransactions = TripTransaction.order('created_at DESC');
    render json: triptransactions.reload, status: :ok
  end

  def show
    triptransaction = TripTransaction.find(params[:id])
    render json: triptransaction.reload, status: :ok
  end

  # def create
  #   triptransaction = TripTransaction.new(triptransaction_params)
  #
  #   if triptransaction.save
  #     render json: triptransaction.reload, status: :ok
  #   else
  #     render json: triptransaction.errors, status: :bad_request
  #   end
  # end

  # def destroy
  #   triptransaction = TripTransaction.find(params[:id])
  #   triptransaction.destroy
  #   render json: triptransaction.reload, status: :ok
  # end

  # def update
  #   triptransaction = TripTransaction.find(params[:id])
  #   if triptransaction.update_attributes(triptransaction_params)
  #     render json: triptransaction.reload, status: :ok
  #   else
  #     render json: triptransaction.errors, status: :bad_request
  #   end
  # end

  private

  def triptransactions_params
    params.permit(:pickup_location, :drop_location, :trip_amount)
  end
end
