class ManufacturersController < ApplicationController
    def index
        @manufacturers = Manufacturer.all
    end
    
    def show
        id = params[:id]
        @manufacturer = Manufacturer.find(id)
    end
    
    def new
        @manufacturer = Manufacturer.new
    end

    def create
        @manufacturer = Manufacturer.new(params.require(:manufacturer).permit(:name))
        if @manufacturer.save
            flash[:notice] = 'Fabricante criado com sucesso'
            redirect_to @manufacturer
        else
            render :new
        end
    end

    def edit
    end
    
end