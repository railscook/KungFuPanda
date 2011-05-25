# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def links
	 arr = []
   arr << link_to("Home", "/")
	 arr << Dir["app/controllers/*.rb"].compact.collect do |f|
        name = f[/(\w+)_controller.rb/, 1]
        link_to(name.camelize, "/#{name.pluralize}") if name != 'application'
    end
   "<div class='right-corner'>" + arr.flatten.compact.join(" | ") + "</div>"
	end
end
