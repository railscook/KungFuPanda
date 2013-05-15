bundle show xxxx

# local server
gem server

vim Gemfile
source 'http://xxx.xxx.xx.xx:8808'

# Get from RVM info
rvm info
#  "/home/your-username/.rvm/gems/ruby-1.9.2-p180@project-name/bundler/gems/amazing_crazy_gems-3df0f8b7ed10"
pwd = Dir.pwd
folders =  Dir['precious*/*.gemspec']
folders.each {|f|
 folder, file = f.split('/')
 path = "#{pwd}/#{folder}"
 Dir.chdir(path)
 
 system "gem build #{file}"
 puts folder; puts file; 

 gem_file = Dir['*-*.gem'].first
 
 system "gem inabox ./#{gem_file}"
}
Dir.chdir(pwd)

