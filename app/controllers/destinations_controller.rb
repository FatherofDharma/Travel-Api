class DestinationsController < ApplicationController

  def index
    @destinations = Destination.all
    json_response(@destinations)
  end

  def show
    @destination = Destination.find(params[:id])
    json_response(@destination)
  end

  def create
    @destination = Destination.create!(dest_params)
    json_response(@destination, :created)
  end

  def update
    @destination = Destination.find(params[:id])
    if @destination.update!(dest_params)
      render status: :ok, json: {
        message: "This destination has been updated successfully!"
      }
    end
  end

  def destroy
    @destination = Destination.find(params[:id])
    if @destination.destroy!
      render status: :ok, json: {
        message: "This quote has been destroyed successfully!"
      }
    end
  end

  private
    def dest_params
      params.permit(:city, :country)
    end

end
