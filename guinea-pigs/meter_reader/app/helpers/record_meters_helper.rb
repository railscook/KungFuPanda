module RecordMetersHelper
  def add_meter_field_link(name) 
    link_to_function name do |page| 
      page.insert_html :bottom, :meter_fields, :partial => 'meter_field', :object => MeterField.new
    end 
  end 

  def fields_for_meter_field(meter_field, &block)
    prefix = meter_field.new_record? ? 'new' : 'existing'
    fields_for("meter[#{prefix}_meter_field_attributes][]", meter_field, &block)
  end

  def calculate_meter(meters)
   opt = Meter::calculate_meter_bill(meters)
   opt
  end

  def unit(x)
   return "0 unit" if x <= 0
   "#{x} units"
  end

  def money(x)
   "£ #{x}"
  end
end
