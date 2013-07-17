class RecordsController < ApplicationController
   before_filter :require_login
  def index
       if params[:registro] == nil or params[:registro] <= '0' then 
        params[:registro] = 2 
    end
    @records = Record.search(params[:buscar]).page(params[:page]).per_page(params[:registro].to_i)

  output = RecordList.new(@records,view_context) # Aquí instancio el documento pdf
    respond_to do |format|
      format.pdf{
      send_data output.render, :filename => "recordslist.pdf", :type => "application/pdf" # este parámetro permite ver el documento pdf en
        }
      format.html #{ render :text => "<h1>Use .pdf</h1>".html_safe }
      format.json { render json: @records  }
    end
  
  end

  def show
      @record = Record.find(params[:id])
  end

  def new
      @record = Record.new
  end

  def edit
     @record = Record.find(params[:id])
  end

  def create
      @record = Record.new(params[:record])
      render :action => :new unless @record.save
      @records = Record.all
      
  end

  def update
      @record = Record.find(params[:id])
      render :action => :edit unless @record.update_attributes(params[:record])
  end

  def destroy
      @record = Record.find(params[:id])
      @record.destroy
      @records = Record.all
     
  end  
end
