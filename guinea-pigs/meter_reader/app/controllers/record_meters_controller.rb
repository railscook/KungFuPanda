class RecordMetersController < ApplicationController
  before_filter :set_charge_types
  def calendar
    @meters = Meter.all :include => "meter_fields", :order => "read_on asc"
    @meter_months = @meters.group_by { |m| m.read_on.beginning_of_month }
#    @meters = Meter.with_daily_usage @meters
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @meters }
    end
  end

  def index
		date = (params[:date] && params[:date].to_date) || Date.today
    @meters = Meter.all :conditions => ["month(read_on) = ? AND year(read_on) = ?",
												 date.month, date.year], 
												:include => "meter_fields", 
												:order => "read_on asc"
    @meters = Meter.with_daily_usage @meters
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @meters }
    end
  end

  def show
    @meter = Meter.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @meter }
    end
  end

  def new
    @meter = Meter.new
    @meter.meter_fields.build
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @meter }
    end
  end

  def edit
    @meter = Meter.find(params[:id])
  end

  def create
    @meter = Meter.new(params[:meter])
    respond_to do |format|
      if @meter.save
        flash[:notice] = 'Meter was successfully created.'
        format.html { redirect_to record_meters_path }
        format.xml  { render :xml => @meter, :status => :created, :location => @meter }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @meter.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @meter = Meter.find(params[:id])

    respond_to do |format|
      if @meter.update_attributes(params[:meter])
        flash[:notice] = 'Meter was successfully updated.'
        format.html { redirect_to(record_meter_path(@meter)) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @meter.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @meter = Meter.find(params[:id])
    @meter.destroy

    respond_to do |format|
      format.html { redirect_to(record_meters_url) }
      format.xml  { head :ok }
    end
  end

  protected
  def set_charge_types
    @charge_types = Meter::charge_types
  end
end
