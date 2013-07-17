class MaterialsController < ApplicationController
   before_filter :require_login
   before_filter :find_user_materials
  def index
    if params[:registro] == nil or params[:registro] <= '0' then 
        params[:registro] = 5 
    end
    @materials = @user.material.search(params[:buscar]).page(params[:page]).per_page(params[:registro].to_i)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @materials }
    end
  end
  def show
    
  end

  def new
      @material = Material.new
  end

  def edit
     
  end

  def create
      @material = @user.material.new(params[:material])
      render :action => :new unless @material.save
      Record.create(:material_id => @material.id)
      @materials = Material.all
  end

  def update
      @material = Material.find(params[:id])
      render :action => :edit unless @material.update_attributes(params[:material])
  end

  def destroy
      @material = Material.find(params[:id])
      @material.destroy
      @materials = Material.all
  end

   private
  
  def find_user_materials
     @user = User.find(params[:user_id])
     @material = Material.find(params[:id]) if params[:id]
  end 
  
end
