class UsabilitiesController < ApplicationController
  # GET /usabilities
  # GET /usabilities.json
  def index
    @usabilities = Usability.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @usabilities }
    end
  end

  # GET /usabilities/1
  # GET /usabilities/1.json
  def show
    @usability = Usability.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @usability }
    end
  end

  # GET /usabilities/new
  # GET /usabilities/new.json
  def new
    @usability = Usability.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @usability }
    end
  end

  # GET /usabilities/1/edit
  def edit
    @usability = Usability.find(params[:id])
  end

  # POST /usabilities
  # POST /usabilities.json
  def create
    @usability = Usability.new(params[:usability])

    respond_to do |format|
      if @usability.save
        format.html { redirect_to @usability, notice: 'Usability was successfully created.' }
        format.json { render json: @usability, status: :created, location: @usability }
      else
        format.html { render action: "new" }
        format.json { render json: @usability.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /usabilities/1
  # PUT /usabilities/1.json
  def update
    @usability = Usability.find(params[:id])

    respond_to do |format|
      if @usability.update_attributes(params[:usability])
        format.html { redirect_to @usability, notice: 'Usability was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @usability.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /usabilities/1
  # DELETE /usabilities/1.json
  def destroy
    @usability = Usability.find(params[:id])
    @usability.destroy

    respond_to do |format|
      format.html { redirect_to usabilities_url }
      format.json { head :no_content }
    end
  end
end
