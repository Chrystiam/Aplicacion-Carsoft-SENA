class PortersController < ApplicationController
   before_filter :require_login
  def index
      if params[:registro] == nil or params[:registro] <= '0' then 
        params[:registro] = 2 
    end
    
    @porters = Porter.search(params[:buscar]).page(params[:page]).per_page(params[:registro].to_i)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @porters }
    end
  end

  def show
      @porter = Porter.find(params[:id])
  end

  def new
      @porter = Porter.new
  end

  def edit
     @porter = Porter.find(params[:id])
  end

  def create
      @porter = Porter.new(params[:porter])
      render :action => :new unless @porter.save
      Record.create(:porter_id => @porter.id)
      @porters = Porter.all
  end

  def update
      @porter = Porter.find(params[:id])
      render :action => :edit unless @porter.update_attributes(params[:porter])
  end

  def destroy
      @porter = Porter.find(params[:id])
      @porter.destroy
      @porters = Porter.all
     
  end  
end
