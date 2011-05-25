class MeterFieldsController < ApplicationController
  # GET /meter_fields
  # GET /meter_fields.xml
  def index
    @meter_fields = MeterField.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @meter_fields }
    end
  end

  # GET /meter_fields/1
  # GET /meter_fields/1.xml
  def show
    @meter_field = MeterField.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @meter_field }
    end
  end

  # GET /meter_fields/new
  # GET /meter_fields/new.xml
  def new
    @meter_field = MeterField.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @meter_field }
    end
  end

  # GET /meter_fields/1/edit
  def edit
    @meter_field = MeterField.find(params[:id])
  end

  # POST /meter_fields
  # POST /meter_fields.xml
  def create
    @meter_field = MeterField.new(params[:meter_field])

    respond_to do |format|
      if @meter_field.save
        flash[:notice] = 'MeterField was successfully created.'
        format.html { redirect_to(@meter_field) }
        format.xml  { render :xml => @meter_field, :status => :created, :location => @meter_field }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @meter_field.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /meter_fields/1
  # PUT /meter_fields/1.xml
  def update
    @meter_field = MeterField.find(params[:id])

    respond_to do |format|
      if @meter_field.update_attributes(params[:meter_field])
        flash[:notice] = 'MeterField was successfully updated.'
        format.html { redirect_to(@meter_field) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @meter_field.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /meter_fields/1
  # DELETE /meter_fields/1.xml
  def destroy
    @meter_field = MeterField.find(params[:id])
    @meter_field.destroy

    respond_to do |format|
      format.html { redirect_to(meter_fields_url) }
      format.xml  { head :ok }
    end
  end
end
