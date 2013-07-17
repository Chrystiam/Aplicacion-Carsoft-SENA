class TeamsController < ApplicationController
   before_filter :require_login
  before_filter :find_user_teams
   def index
    if params[:registro] == nil or params[:registro] <= '0' then 
        params[:registro] = 2 
    end
    @teams = @user.team.search(params[:buscar]).page(params[:page]).per_page(params[:registro].to_i)
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @teams }
    end
  end
  def show
     
  end

  def new
      @team = Team.new
  end

  def edit
    
  end

  def create
      @team =  @user.team.new(params[:team])
      render :action => :new unless @team.save
      Record.create(:team_id => @team.id)
      @teams = Team.all
  end

  def update
      @team = Team.find(params[:id])
      render :action => :edit unless @team.update_attributes(params[:team])
  end

  def destroy
      @team = Team.find(params[:id])
      @team.destroy
       @teams = Team.all
  end
   
  private
  
  def find_user_teams
     @user = User.find(params[:user_id])
     @team = Team.find(params[:id]) if params[:id]
  end  
end
