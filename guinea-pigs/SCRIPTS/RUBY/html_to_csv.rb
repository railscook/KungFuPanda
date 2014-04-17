class HtmlToCsv
  attr_accessor :input_file, :output_file
  def initialize
    @input_file = get_file('Please type your input file with path')
    @output_file = get_file('Please type your output file with path')
  end

  def start
    lines = File.readlines(@input_file)
    page_sources = lines.join('')

    page_sources= File.read(@input_file)
    page_sources.gsub!("\n","")

    rows = page_sources.split('</tr>')

    booking_id_regex = /([0-9]*)<\/a><\/td>/
    action_status = booking_status = guest_name = /<td>(\w*\s*\w*\s*\w*\s*\w*)<\/td>/
    book_date = check_in_date = check_out_date = /<td>([0-9]*-\w*-[0-9]*)<\/td>/
    title = />\s*(\w* \w* \w*)\s*<div/

    # /([0-9]*)<\/a><\/td>|<td>(\w*|\w*\s*\w*\s*\w*\s*\w*|[0-9]*-\w*-[0-9]*)<\/td>/

    File.open(@output_file, 'w') do |file|

        rows.each do |str|
        data = []
        [title, booking_id_regex, guest_name, book_date].each do |regex|
                data << str.scan(regex)
        end

        data.flatten!
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

