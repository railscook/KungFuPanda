
path = Dir.pwd
puts path

p "Please fill the original extension (e.g html, txt, exe )"
original_ext = gets

p "Please fill the desired extension (e.g html, txt, exe )"
ext = gets

original_ext.strip!
ext.strip!

Dir["*.#{original_ext}"].each {|e| 
  name, original_ext = e.split('.')
  puts 'File name:'
  puts name

  system "mv '#{e}' '#{name}.#{ext}'" 
}

