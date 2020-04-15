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
        @manufacturer = Manufacturer.new(manufacturer_params)
        if @manufacturer.save
            flash[:notice] = 'Fabricante criado com sucesso'
            redirect_to @manufacturer
        else
            render :new
        end
    end

    def edit
        @manufacturer = Manufacturer.find(params[:id])
    end

    def update
        @manufacturer = Manufacturer.find(params[:id])
        
        if @manufacturer.update(manufacturer_params)
            flash[:notice] = 'Fabricante editado com sucesso'
            redirect_to @manufacturer
        else
            render :edit
        end
    end

    def destroy
        @manufacturer = Manufacturer.find(params[:id])
        @manufacturer.destroy
        flash[:notice] = 'Fabricante excluído com sucesso'
        redirect_to manufacturers_path
    end


    private

    def manufacturer_params
        params.require(:manufacturer).permit(:name)
      end
      
end