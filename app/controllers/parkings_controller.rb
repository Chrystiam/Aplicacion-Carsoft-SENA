class ParkingsController < ApplicationController
   before_filter :require_login
  def index
      if params[:registro] == nil or params[:registro] <= '0' then 
        params[:registro] = 2 
    end
    
    @parkings = Parking.search(params[:buscar]).page(params[:page]).per_page(params[:registro].to_i)


    output = ParkingList.new(@parkings,view_context) # Aquí instancio el documento pdf
    respond_to do |format|
      format.pdf{
      send_data output.render, :filename => "parkingslist.pdf", :type => "application/pdf", :disposition => "inline" # este parámetro permite ver el documento pdf en
        }
      format.html #{ render :text => "<h1>Use .pdf</h1>".html_safe }
      format.json { render json: @parkings  }
    end
  
  end


  def show
      @parking = Parking.find(params[:id])
  end

  def new
      @parking = Parking.new
  end

  def edit
      @parking = Parking.find(params[:id])
  end

  def create
      @parking = Parking.new(params[:parking])
      render :action => :new unless @parking.save
      
  end

  def update
      @parking = Parking.find(params[:id])
      render :action => :edit unless @parking.update_attributes(params[:parking])
  end

  def destroy
      @parking = Parking.find(params[:id])
      @parking.destroy
     
  end  
end
