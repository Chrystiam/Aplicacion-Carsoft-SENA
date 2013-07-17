class TypeUsersController < ApplicationController
   before_filter :require_login
  def index
     if params[:registro] == nil or params[:registro] <= '0' then 
        params[:registro] = 5 
    end
    @type_users = TypeUser.search(params[:buscar]).page(params[:page]).per_page(params[:registro].to_i)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @type_users }
    end
  end
  def show
      @type_user = TypeUser.find(params[:id])
  end

  def new
      @type_user = TypeUser.new
  end

  def edit
     @type_user = TypeUser.find(params[:id])
  end

  def create
      @type_user = TypeUser.new(params[:type_user ])
      render :action => :new unless @type_user.save
      @type_users = TypeUser.all
      
  end

  def update
      @type_user = TypeUser.find(params[:id])
      render :action => :edit unless @type_user.update_attributes(params[:type_user ])
  end

  def destroy
      @type_user = TypeUser.find(params[:id])
      @type_user.destroy
      @type_users = TypeUser.all
     
  end  
end
