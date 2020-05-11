class RentalsController < ApplicationController
  before_action :authenticate_user!

  def index
    @rentals = Rental.all
  end
  

  def show
    @rental = Rental.find(params[:id])
  end
    
  def new
    @rental = Rental.new
  end

  def create
    @rental = Rental.new(rental_params)
    @rental.save
    redirect_to @rental
  end


  private

  def rental_params
    params.require(:rental).permit(:start_date, :end_date, :customer_id, :car_category_id)
  end
end