class SubsidiariesController < ApplicationController
    def index
        @subsidiaries = Subsidiary.all
    end
    
    def show
        id = params[:id]
        @subsidiary = Subsidiary.find(id)
    end
    
    #def new
    #    @manufacturer = Manufacturer.new
    #end

    #def create
    #    @manufacturer = Manufacturer.new
    #    @manufacturer.name = params[:manufacturer][:name]
    #    @manufacturer.save
    #    redirect_to @manufacturer
    #end

end