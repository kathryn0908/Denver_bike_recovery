class ZipcodesController < ApplicationController
    def index
        @zipcodes = Zipcode.all 
        render json: @zipcodes
    end

    def show
        @zipcode = Zipcode.find(params[:id])
        if @zipcode
           render json: @zipcode
        elser
            render json: {message:"We couldn't find a zipcode with that id"}
        end
    end

    def create
        @zipcode = Zipcode.new(
            zipcode: params[:zipcode],
            city: params[:city]
            
        )
        if @zipcode.save
            render json: @zipcode
        else 
            render status: 422
        end
    end
end
