require 'selenium-webdriver'

def rescue_error_on_time(time, driver, text, code)
begin
#puts code
eval(code)
rescue Exception => e
#puts e
time-=1
#puts "rescue"
rescue_error_on_time(time, driver, text, code) if time > 0
end
end

def start
p "Please type your text"
file = gets
file.chomp!

if File.exist?(file)
 lines = File.readlines(file)
 lines.each do |line|
  translate(line)
 end

else
 puts "File not found"
end
end

def translate(line)

# header not to stop for text started with English and stop converting the rest into Burmese
header_text = %w{min ga lar par}
burglish_text = header_text << line.split(" ")
burglish_text.flatten!

myanmar_text = []
url="http://burglish.my-mm.org/latest/trunk/web/testarea.htm"; myText = "nay"; driver = Selenium::WebDriver.for :firefox; driver.navigate.to url; 
burglish_text.each do |text|
 text = rescue_error_on_time(2, driver, text, "element = driver.find_element(:id, 'testarea'); element.send_keys text; element.send_keys :space; el = driver.find_element(:id, 'wOtestarea0'); el.click; element = driver.find_element(:id, 'testarea');   value = element.attribute(:value); element.clear; return value;");

 
 puts text
 myanmar_text << text
end
driver.quit
myanmar_text

puts "Burglish Text is:"
puts burglish_text.join(" ")
puts "Myanmar Text is:"
puts myanmar_text.join("")

end


# start from here
start
