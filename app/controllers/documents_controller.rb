class DocumentsController < ApplicationController
   before_filter :require_login
  def index
      if params[:registro] == nil or params[:registro] <= '0' then 
        params[:registro] = 2 
    end
    @documents = Document.search(params[:buscar]).page(params[:page]).per_page(params[:registro].to_i)

    respond_to do |format|
      format.html
      format.json { render json: @documents }
    end
  end
  def show
      @document = Document.find(params[:id])
  end

  def new
      @document = Document.new
  end

  def edit
      @document = Document.find(params[:id])
  end

  def create
      @document = Document.new(params[:document])
      render :action => :new unless @document.save
      @documents = Document.all
  end

  def update
      @document =  Document.find(params[:id])
      render :action => :edit unless @document.update_attributes(params[:document])
  end

  def destroy
      @document = Document.find(params[:id])
      @document.destroy
      @documents = Document.all
  end
  
end
