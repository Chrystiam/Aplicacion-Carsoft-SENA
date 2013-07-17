class TypeVehiclesController < ApplicationController
   before_filter :require_login
  def index
      if params[:registro] == nil or params[:registro] <= '0' then 
        params[:registro] = 5 
    end
    @type_vehicles = TypeVehicle.search(params[:buscar]).page(params[:page]).per_page(params[:registro].to_i)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @type_vehicles }
    end
  end
  def show
      @type_vehicle = TypeVehicle.find(params[:id])
  end

  def new
      @type_vehicle = TypeVehicle.new
  end

  def edit
     @type_vehicle = TypeVehicle.find(params[:id])
  end

  def create
      @type_vehicle = TypeVehicle.new(params[:type_vehicle ])
      render :action => :new unless @type_vehicle.save
      @type_vehicles = TypeVehicle.all
      
  end

  def update
      @type_vehicle = TypeVehicle.find(params[:id])
      render :action => :edit unless @type_vehicle.update_attributes(params[:type_vehicle ])
  end

  def destroy
      @type_vehicle = TypeVehicle.find(params[:id])
      @type_vehicle.destroy
      @type_vehicles = TypeVehicle.all
     
  end  
end
