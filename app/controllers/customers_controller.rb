class CustomersController < ApplicationController
  def index
    @customers = Customer.all
  end
  
  def show
    id = params[:id]
    @customer = Customer.find(id)
  end
    
  def new
    @customer = Customer.new
  end

  def create
    @customer = Customer.new(customer_params)
    @customer.save
    redirect_to @customer
  end

  def search
    @q = params[:q]
    @customers = Customer.search(@q)
    render :index
  end

  private

  def customer_params
    params.require(:customer).permit(:name, :document, :email)
  end
end