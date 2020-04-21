class SubsidiariesController < ApplicationController
  def index
    @subsidiaries = Subsidiary.all
  end
    
  def show
    id = params[:id]
    @subsidiary = Subsidiary.find(id)
  end
    
  def new
    @subsidiary = Subsidiary.new
  end

  def create
    @subsidiary = Subsidiary.new(subsidiary_params)
    @subsidiary.save
    redirect_to @subsidiary
  end

  private

  def subsidiary_params
    params.require(:subsidiary).permit(:name, :cnpj, :address)
  end
end