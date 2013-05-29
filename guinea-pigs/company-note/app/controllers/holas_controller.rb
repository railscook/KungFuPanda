class HolasController < ApplicationController
  # GET /holas
  # GET /holas.json
  def index
    @holas = Hola.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @holas }
    end
  end

  # GET /holas/1
  # GET /holas/1.json
  def show
    @hola = Hola.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @hola }
    end
  end

  # GET /holas/new
  # GET /holas/new.json
  def new
    @hola = Hola.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @hola }
    end
  end

  # GET /holas/1/edit
  def edit
    @hola = Hola.find(params[:id])
  end

  # POST /holas
  # POST /holas.json
  def create
    @hola = Hola.new(params[:hola])

    respond_to do |format|
      if @hola.save
        format.html { redirect_to @hola, notice: 'Hola was successfully created.' }
        format.json { render json: @hola, status: :created, location: @hola }
      else
        format.html { render action: "new" }
        format.json { render json: @hola.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /holas/1
  # PUT /holas/1.json
  def update
    @hola = Hola.find(params[:id])

    respond_to do |format|
      if @hola.update_attributes(params[:hola])
        format.html { redirect_to @hola, notice: 'Hola was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @hola.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /holas/1
  # DELETE /holas/1.json
  def destroy
    @hola = Hola.find(params[:id])
    @hola.destroy

    respond_to do |format|
      format.html { redirect_to holas_url }
      format.json { head :no_content }
    end
  end
end
