class CarModelsController < ApplicationController
  def index
    @car_models = CarModel.all
  end

  def show
    id = params[:id]
    @car_model = CarModel.find(id)
  end
  
  
end