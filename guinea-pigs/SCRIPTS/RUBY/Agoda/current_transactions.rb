class HtmlToCsv
  attr_accessor :input_file, :output_file
  def initialize
    @input_file = get_file('Please type your input file with path')
    @output_file = get_file('Please type your output file with path')
  end

  def start
    page_sources= File.read(@input_file)
    page_sources.gsub!("\n","")

    rows = page_sources.split('</tr>')

    booking_id_regex = /([0-9]*)<\/a><\/td>|([0-9]{8})<\/td>/
    guest_name = />(\w*\s+\w*\s*\w*\s*\w*\s*\w*\s*\w*)<\/td>/ 
    book_date = check_in_date = check_out_date = /([0-9]*-\w*-[0-9]*)<\/td>/
    amount = />(\d*\.\d*)<\/td>|>(0)<\/td>/


    title = />\s*(\w*\s*\w*\s*\w*)\s*<\/th|>\s*(\w*\s*\w*\s*\w*)\s*<\/div|>(\w*-\w*\s*\w*)<\/div|>(\w*.\s*\w*\s*\w*)<\/div/


    File.open(@output_file, 'w') do |file|

        rows.each do |str|
        data = []
        [title, booking_id_regex, guest_name, amount, book_date].each do |regex|
                foo = str.scan(regex)
		data << foo
        end

        data.flatten!
	data.compact!
        line = data.join(',')
        file.write(line)
        file.write("\n")
        end

    end
    
  end

  def get_file(message)
    p message
    data = gets
    data.chomp!            # Remove / at the end (because system will put / for link)
  end
end 

convert = HtmlToCsv.new
convert.start

