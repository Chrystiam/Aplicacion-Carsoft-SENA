class ModifyUsersController < ApplicationController
   before_filter :require_login
  before_filter :find_user_modify_users
 
  def index
    if params[:registro] == nil or params[:registro] <= '0' then 
        params[:registro] = 2 
    end
    @modify_users = @user.modify_user.search(params[:buscar]).page(params[:page]).per_page(params[:registro].to_i)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @modify_users }
    end
  end
  def show
    
  end

  def new
      @modify_user = ModifyUser.new
  end

  def edit
     
  end

  def create
      @modify_user = @user.modify_user.new(params[:modify_user])
      render :action => :new unless @modify_user.save
      @modify_users = ModifyUser.all
  end

  def update
      @modify_user = ModifyUser.find(params[:id])
      render :action => :edit unless @modify_user.update_attributes(params[:modify_user])
  end

  def destroy
      @modify_user = ModifyUser.find(params[:id])
      @modify_user.destroy
      @modify_users = ModifyUser.all
  end

  private
  
  def find_user_modify_users
     @user = User.find(params[:user_id])
     @modify_user = ModifyUser.find(params[:id]) if params[:id]
  end
  
end
