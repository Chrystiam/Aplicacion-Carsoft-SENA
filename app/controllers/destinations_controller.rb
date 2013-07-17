class DestinationsController < ApplicationController
   before_filter :require_login
 def index
   if params[:registro] == nil or params[:registro] <= '0' then 
        params[:registro] = 5
    end
    @destinations = Destination.search(params[:buscar]).page(params[:page]).per_page(params[:registro].to_i)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @destinations }
    end
  end
  def show
      @destination = Destination.find(params[:id])
  end

  def new
      @destination = Destination.new
  end

  def edit
      @destination = Destination.find(params[:id])
  end

  def create
      @destination = Destination.new(params[:destination])
      render :action => :new unless @destination.save
      @destinations = Destination.all
  end

  def update
      @usability =  Destination.find(params[:id])
      render :action => :edit unless @destination.update_attributes(params[:destination])
  end

  def destroy
      @destination = Destination.find(params[:id])
      @destination.destroy
      @destinations = Destination.all
  end
  
end
