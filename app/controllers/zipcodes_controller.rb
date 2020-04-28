class ZipcodesController < ApplicationController
    def index
        @zipcodes = Zipcode.all 
        render json: @zipcodes
    end

    def show
        @zipcode = Zipcode.find(params[:id])
        if @zipcode
           render json: zipcode
        else
            render json: {message:"We couldn't find a zipcode with that id"}
        end
    end

    def create
        @zipcode = Zipcode.new(
            zipcode: params[:zipcode],
            
        )
    end
end
