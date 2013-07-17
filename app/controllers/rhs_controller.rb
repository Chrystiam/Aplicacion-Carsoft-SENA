class RhsController < ApplicationController
   before_filter :require_login
  def index
    if params[:registro] == nil or params[:registro] <= '0' then 
        params[:registro] = 2 
    end
    @rhs = Rh.search(params[:buscar]).page(params[:page]).per_page(params[:registro].to_i)

    respond_to do |format|
      format.html 
      format.json { render json: @rhs }
    end
  end
  def show
      @rh = Rh.find(params[:id])
  end

  def new
      @rh = Rh.new
  end

  def edit
     @rh = Rh.find(params[:id])
  end

  def create
      @rh = Rh.new(params[:rh])
      render :action => :new unless @rh.save
      @rhs = Rh.all
      
  end

  def update
      @rh = Rh.find(params[:id])
      render :action => :edit unless @rh.update_attributes(params[:rh])
  end

  def destroy
      @rh = Rh.find(params[:id])
      @rh.destroy
      @rhs = Rh.all
     
  end  
end
