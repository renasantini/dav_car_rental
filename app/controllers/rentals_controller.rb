class RentalsController < ApplicationController
  before_action :authenticate_user!

  def index
    @rentals = Rental.all
  end
  
  def new
    @rental = Rental.new
  end

  def create
    @rental = Rental.new(rental_params)
    @rental.save
    RentalsMailer.scheduled(@rental).deliver_now
    redirect_to @rental
  end

  def search
    @q = params[:q]
    @rental = Rental.find_by(code: @q.upcase)
  end

  def show
    id = params[:id]
    @rental = Rental.find(id)
  end

  private

  def rental_params
    params.require(:rental).permit(:start_date, :end_date, :customer_id, :car_category_id)
  end
end