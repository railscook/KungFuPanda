require 'selenium-webdriver'

def rescue_error_on_time(time, driver, text, code)
begin
puts code
eval(code)
rescue Exception => e
puts e
time-=1
puts "rescue"
rescue_error_on_time(time, driver, text, code) if time > 0
end
end


p "Please type your text"
burglish_text = gets
burglish_text.chomp!
burglish_text = burglish_text.split(" ")

#burglish_text = %w{min ga lar par shin nay kg lar sar pi pi lar Marks}

myanmar_text = []
url="http://burglish.my-mm.org/latest/trunk/web/testarea.htm"; myText = "nay"; driver = Selenium::WebDriver.for :firefox; driver.navigate.to url; 
burglish_text.each do |text|
 myanmar_text << rescue_error_on_time(2, driver, text, "element = driver.find_element(:id, 'testarea'); element.send_keys text; element.send_keys :space; el = driver.find_element(:id, 'wOtestarea0');  el.click; element = driver.find_element(:id, 'testarea');   value = element.attribute(:value); puts value;element.clear; return value;");
end
driver.quit
myanmar_text

puts "Burglish Text is:"
puts burglish_text.join(" ")
puts "Myanmar Text is:"
puts myanmar_text.join("")

