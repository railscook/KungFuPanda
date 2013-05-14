# set extension
# put path

Dir["*"].each {|dir| 

  sub_dir = Dir[dir+"/*"]
  if sub_dir.size > 0 
    puts "is directory"
  else
    if dir.split(".").last != "html"
      system("mv '#{dir}' '#{dir}.html'")
    end
  end

}


