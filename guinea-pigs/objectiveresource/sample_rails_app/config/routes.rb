ActionController::Routing::Routes.draw do |map|
  map.root :controller => 'people', :action =>  'index'
  map.resources :people
  
  map.resources :people do |person|
    person.resources :dogs
  end

  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
