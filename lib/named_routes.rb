module JsNamedRoutes
  class ControllerMethods
    
    def self.add_routes
      ActionController::Routing::Routes.add_route '/javascripts/named_routes.:format', :controller => 'named_routes', :action => 'generate'
    end
    
  end
end