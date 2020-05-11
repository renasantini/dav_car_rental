class CarModelsController < ApplicationController
  before_action :authenticate_user!

  def index
    @car_models = CarModel.all
  end

  def show
    id = params[:id]
    @car_model = CarModel.find(id)
  end

  def new
    @car_model = CarModel.new
  end
  
  def create
    @car_model = CarModel.new(car_model_params)
    if @car_model.save
      flash[:success] = "Modelo de veículo criado com sucesso"
      redirect_to @car_model
    else
      render 'new'
    end
  end
  
  private

  def car_model_params
    params.require(:car_model).permit(:name, :year, :motorization, :fuel_type,
                                      :manufacturer_id, :car_category_id)
  end
end