class Api::V1::RecommendationsController < ApplicationController

    def create
        @trip = Trip.find(params[:trip_id])
        @recommendation = @trip.recommendations.new(recommendation_params)
        if @recommendation.save
            render json: @trip
        else
            render json: {error: 'Error creating recommendation'}
        end
    end

    def destroy
        @recommendation = Recommendation.find(params[:id])
        @trip = Trip.find(@recommendation.trip_id)
        @recommendation.destroy
        render json: @trip
    end

    private

    def recommendation_params
        params.require(:recommendation).permit(:title, :description, :trip_id)
    end

end
