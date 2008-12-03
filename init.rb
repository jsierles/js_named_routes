require 'named_routes'
require 'asset_tag_helper'

require 'dispatcher'

ActionView::Helpers::AssetTagHelper.send(:include, JsNamedRoutes::AssetTagHelper)

ActionController::Routing::RouteSet.class_eval do
  def load_routes_with_named_routes!
    load_routes_without_named_routes!
    JsNamedRoutes::ControllerMethods.add_routes 
  end

  alias_method_chain :load_routes!, :named_routes
end

controller_path = File.join(File.dirname(__FILE__), 'controllers')
$LOAD_PATH << controller_path
if ActiveSupport.const_defined?(:Dependencies)
  ActiveSupport::Dependencies.load_paths << controller_path
else
  ::Dependencies.load_paths << controller_path
end
