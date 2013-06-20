class AuthorizationsController < ApplicationController
   before_filter :require_login
  def index
    @authorizations = Authorization.all

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
  end

  def update
    @authorization = Authorization.find(params[:id])
    render :action => :edit unless @authorization.update_attributes(params[:authorization])
  end
  
  def destroy
    @authorization = Authorization.find(params[:id])
    @authorization.destroy
  end
end