class AuthorizationsController < ApplicationController
   before_filter :require_login
  def index
    if params[:registro] == nil or params[:registro] <= '0' then 
            params[:registro] = 6
    end
    @authorizations = Authorization.search(params[:buscar]).page(params[:page]).per_page(params[:registro].to_i)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @authorizations }
    end
  end

  def show
    @authorization = Authorization.find(params[:id])
  end

  def new
    @authorization = Authorization.new
  end

  def edit
    @authorization = Authorization.find(params[:id])
  end

  def create
    @authorization = Authorization.new(params[:authorization])
    render :action => :new unless @authorization.save
    @authorization = Authorization.all
  end

  def update
    @authorization = Authorization.find(params[:id])
    render :action => :edit unless @authorization.update_attributes(params[:authorization])
  end
  
  def destroy
    @authorization = Authorization.find(params[:id])
    @authorization.destroy
    @authorization = Authorization.all
  end
end