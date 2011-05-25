class Meter < ActiveRecord::Base
 has_many :meter_fields
 validates_uniqueness_of :read_on, :message => "Read on should be unique"
 named_scope :day_rate, :include => :meter_fields, :conditions => ["meter_fields.name = ?", "Day Rate"]
 accepts_nested_attributes_for :meter_fields, :allow_destroy => true
 attr_accessor :day_diff, :night_diff

 def daily_usage(old_rate, new_rate)
   puts "#{new_rate.to_i} - #{old_rate.to_i} = #{new_rate.to_i - old_rate.to_i}"
   new_rate.to_i - old_rate.to_i
 end

 def self.add_previous_and_next_month(meters)
  current_month = meters.first.read_on.month
  previous_month = Meter.find :last, 
															:conditions => ["month(read_on) = ? ", current_month-1], 
															:order => "read_on asc"
  next_month = Meter.find :first, 
													:conditions => ["month(read_on) = ? ", current_month+1], 
													:order => "read_on asc"
  meters = [previous_month, meters] # [previous_month, meters, next_month]
  meters.flatten.compact
 end

 def self.with_daily_usage(meters)
  x = {}
  meters = add_previous_and_next_month(meters)
  meters.collect do |meter|
        %w{day night}.each do |tz|
					rate, rate_diff = ("%s_rate" % tz), ("%s_diff=" % tz)
          old_rate, new_rate = ("%s_old_rate" % tz).to_sym, ("%s_new_rate" % tz).to_sym
        	x[new_rate] = meter.send(rate)
        	meter.send(rate_diff, meter.daily_usage(x[old_rate], x[new_rate]))
  				x[old_rate] = x[new_rate]
        end
	meter
  end

 end
 
 def day_rate
   m = meter_fields.find_by_name "Day Rate" 
   m.data if m
 end

 def night_rate
   m = meter_fields.find_by_name "Night Rate" 
   m.data if m
 end

 def self.calculate_meter_bill(meters)
   opt = {}
   meters = add_previous_and_next_month(meters)
   last_day_rate = first_day_rate = first_night_rate = last_night_rate = 0
   if (lmff = meters.last.meter_fields.first) && lmff && lmff.data
	 last_day_rate = lmff.data.to_i
   end
   if (fmff = meters.first.meter_fields.first) && fmff && fmff.data
	first_day_rate = fmff.data.to_i 
   end
   if (lmfs = meters.last.meter_fields.second) && lmfs && lmfs.data
 	last_night_rate = lmfs.data.to_i 
   end
   if (fmfs = meters.first.meter_fields.second) && fmfs && fmfs.data
	first_night_rate = fmfs.data.to_i 
   end

   opt[:day_rate] = last_day_rate - first_day_rate
   opt[:night_rate] = last_night_rate - first_night_rate
   opt[:day_cost]   = opt[:day_rate] * 0.14
   opt[:night_cost] = opt[:night_rate] * 0.05
   opt[:total_cost] = opt[:day_cost] + opt[:night_cost]
   opt

 end

 def self.charge_types
   MeterType.all.collect(&:name)
 end

 def meter_fields=(attrs_array)
   attrs_array.each do |attrs|
     meter_fields.create(attrs)
   end
 end

  validates_associated :meter_fields
  
  after_update :save_meter_fields

  def new_meter_field_attributes=(meter_field_attributes)
    meter_field_attributes.each do |attributes|
      meter_fields.build(attributes)
    end
  end
  
  def existing_meter_field_attributes=(meter_field_attributes)
    meter_fields.reject(&:new_record?).each do |meter_field|
      attributes = meter_field_attributes[meter_field.id.to_s]
      if attributes
        meter_field.attributes = attributes
      else
        meter_fields.delete(meter_field)
      end
    end
  end
  
  def save_meter_fields
    meter_fields.each do |meter_field|
      meter_field.save(false)
    end
  end

end
