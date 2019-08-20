class ReviewsController < ApplicationController

  def index
    @destination = Destination.find(params[:destination_id])
    @reviews = @destination.reviews
    json_response(@reviews)
  end

  def create
    @destination = Destination.find(params[:destination_id])
    @review = @destination.reviews.create!(review_params)
    json_response(@review, :created)
  end

  def show
    @destination = Destination.find(params[:destination_id])
    @review = @destination.reviews.find(params[:id])
    json_response(@review)
  end

  def update
    @destination = Destination.find(params[:destination_id])
    @review = @destination.reviews.find(params[:id])
    if params[:user_name] == @review.user_name
      if @review.update!(review_params)
        render status: :ok, json: {
          message: "This review has been successfully updated!"
        }
      end
    else
      render status: :ok, json: {
        message: "You do not have permission to edit this review!"
      }
    end
  end

  def destroy
    @destination = Destination.find(params[:destination_id])
    @review = @destination.reviews.find(params[:id])
    if params[:user_name] == @review.user_name
      if @review.destroy!
        render status: :ok, json: {
          message: "This review has been successfully destroyed!"
        }
      end
    else
      render status: :ok, json: {
        message: "You do not have permission to delete this review!"
      }
    end
  end

  private
    def review_params
      params.permit(:user_name, :content, :rating)
    end

end
