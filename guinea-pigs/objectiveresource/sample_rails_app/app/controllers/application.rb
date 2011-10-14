# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base         
  before_filter :send_form_authenticity_token
  
  helper :all # include all helpers, all the time

  # See ActionController::RequestForgeryProtection for details
  # Uncomment the :secret if you're not using the cookie session store
  protect_from_forgery # :secret => '49917d2bb094a73a366c1b0a77e0e35e'
  
  # See ActionController::Base for details 
  # Uncomment this to filter the contents of submitted sensitive data parameters
  # from your application log (in this case, all fields with names like "password"). 
  # filter_parameter_logging :password
  
  private
    def send_form_authenticity_token                        
      response.headers["Cache-Control"] = "no-cache, no-store, max-age=0, must-revalidate"
      response.headers["Pragma"] = "no-cache"
      response.headers["Expires"] = "Fri, 01 Jan 1990 00:00:00 GMT"
      response.headers['X-Authenticity-Token'] = form_authenticity_token 
      
      puts "HIIIIIIII"*1000
      puts "  form_authenticity_toke  #{form_authenticity_token}  " 
      puts "response.headers['X-Authenticity-Token']   ##{ response.headers['X-Authenticity-Token']}" 
    end  
end
