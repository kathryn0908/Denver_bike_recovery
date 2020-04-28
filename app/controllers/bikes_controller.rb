 class BikesController < ApplicationController
    def index
        @bikes = Bike.all 
        render json: @bikes, include: [:zipcode]

    end

    def show
        @bike = Bike.find(params[:id])
        if @bike
           render json: @bike
        else
            render json: {message:"We couldn't find a bike with that id"}
        end
    end

    def create
        @bike = Bike.new(
            title: params[:title],
            description: params[:description],
            image: params[:image],
            zipcode_id: params[:zipcode_id]
        )
        if @bike.save
            redirect_to 'http://localhost:3001/'
        else 
            render status: 422
        end
    end
end
