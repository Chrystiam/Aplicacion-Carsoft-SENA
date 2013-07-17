class TurnsController < ApplicationController
   before_filter :require_login
  def index
  
    if params[:registro] == nil or params[:registro] <= '0' then 
        params[:registro] = 2 
    end
    @turns = Turn.search(params[:buscar]).page(params[:page]).per_page(params[:registro].to_i)
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @turns }
    end
  end
  def show
      @turn = Turn.find(params[:id])
  end

  def new
      @turn = Turn.new
  end

  def edit
     @turn = Turn.find(params[:id])
  end

  def create
      @turn= Turn.new(params[:turn ])
      render :action => :new unless @turn.save
      @turns = Turn.all
      
  end

  def update
      @turn = Turn.find(params[:id])
      render :action => :edit unless @turn.update_attributes(params[:turn ])
  end

  def destroy
      @turn = Turn.find(params[:id])
      @turn.destroy
      @turns = Turn.all
     
  end  
end
