class VehiclesController < ApplicationController
   before_filter :require_login
   before_filter :find_user_vehicles
  def index
    if params[:registro] == nil or params[:registro] <= '0' then 
        params[:registro] = 2 
    end
    @vehicles = @user.vehicle.search(params[:buscar]).page(params[:page]).per_page(params[:registro].to_i)
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @vehicles }
    end
  end
  def show
     
  end

  def new
      @vehicle = Vehicle.new
  end

  def edit

  end

  def create
      @vehicle = @user.vehicle.build(params[:vehicle])
      render :action => :new unless @vehicle.save
      Record.create(:vehicle_id => @vehicle.id)
  end

  def update
      render :action => :edit unless @vehicle.update_attributes(params[:vehicle])
  end

  def destroy
      @vehicle.destroy
  end 

  private

  def find_user_vehicles
     @user = User.find(params[:user_id])
     @vehicle = Vehicle.find(params[:id]) if params[:id]
  end
 
end
