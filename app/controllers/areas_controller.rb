class AreasController < ApplicationController
   before_filter :require_login
  def index
      if params[:registro] == nil or params[:registro] <= '0' then 
        params[:registro] = 2 
    end
    @areas = Area.search(params[:buscar]).page(params[:page]).per_page(params[:registro].to_i)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @areas }
    end
  end

  def show
      @area = Area.find(params[:id])
  end

  def new
      @area = Area.new
  end

  def edit
      @area = Area.find(params[:id])
  end

  def create
      @area = Area.new(params[:area])
      render :action => :new unless @area.save
      @areas = Area.all
      
  end

  def update
      @area = Area.find(params[:id])
      render :action => :edit unless @area.update_attributes(params[:area])
  end

  def destroy
      @area = Area.find(params[:id])
      @area.destroy
      @areas = Area.all
     
  end  
end
