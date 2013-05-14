puts '1. Set Alarm'
puts '2. Set alert for every X minute'

p 'Please choose your selection'
user_selection = gets

user_selection.strip!

case user_selection
  when "1"

  when "2"
    p 'How often do you want to get alert? (in minutes)'
    duration = gets
    duration.strip!
    duration = duration.to_i
    
    seconds = duration * 60

    while(true)
      seconds = duration * 60

      while(seconds > 0)
        sleep(1)
        seconds -= 1
      end
      system("open alert.wav")
    end

end
