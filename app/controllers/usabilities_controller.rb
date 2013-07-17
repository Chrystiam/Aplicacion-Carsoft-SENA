class UsabilitiesController < ApplicationController
   before_filter :require_login
 def index
   if params[:registro] == nil or params[:registro] <= '0' then 
        params[:registro] = 5
    end
    @usabilities = Usability.search(params[:buscar]).page(params[:page]).per_page(params[:registro].to_i)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @usabilities }
    end
  end
  def show
      @usability = Usability.find(params[:id])
  end

  def new
      @usability = Usability.new
  end

  def edit
      @usability = Usability.find(params[:id])
  end

  def create
      @usability = Usability.new(params[:usability])
      render :action => :new unless @usability.save
      @usabilities = Usability.all
  end

  def update
      @usability =  Usability.find(params[:id])
      render :action => :edit unless @usability.update_attributes(params[:usability])
  end

  def destroy
      @usability = Usability.find(params[:id])
      @usability.destroy
      @usabilities = Usability.all
  end
  
end
