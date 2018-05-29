class TransportFaresController < ApplicationController
  layout 'admin'

  def view_transport_fare
    @transport_fare = TransportFare.all
  end

  def edit_transport_fare
		@transport_fare = TransportFare.find(params[:id])
	end

  def update_transport_fare
    p params
    @transport_fare = TransportFare.find(params[:transport_fare][:id])
    if @transport_fare.update(transportfares_params)
      redirect_to view_transport_fare_path
    else
      render 'edit_transport_fare'
    end
	end

  private

  def transportfares_params
    params.require(:transport_fare).permit(:pickup_location, :drop_location, :trip_amount)
  end
end
