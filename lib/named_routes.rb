module NamedRoutes
  class ControllerMethods
    def self.add_routes
      ActionController::Routing::Routes.add_route '/named_routes.:format', :controller => 'named_routes', :action => 'generate'
    end
  end
end