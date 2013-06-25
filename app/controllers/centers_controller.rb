class CentersController < ApplicationController
   before_filter :require_login
   before_filter :find_area_center_centers

  def index
   if params[:registro] == nil or params[:registro] <= '0' then 
        params[:registro] = 2 
    end
    @centers = Center.search(params[:buscar]).page(params[:page]).per_page(params[:registro].to_i)

    respond_to do |format|
      format.html 
      format.json { render json: @centers }
    end
  end

  def show
  end

  def new
      @center = Center.new
  end

  def edit
  end

  def create
      @center = Center.new(params[:center])
      @center.name = Center.center_ubicacion(@center.name, @area_center)
      render :action => :new unless @center.save
      Record.create(:center_id => @center.id)
  end

  def update
      render :action => :edit unless @center.update_attributes(params[:center])
  end

  def destroy
      @center.destroy
  end
  
  private

  def find_area_center_centers
     @area_center = AreaCenter.find(params[:area_center_id])
     @center = Center.find(params[:id]) if params[:id]
  end

end
