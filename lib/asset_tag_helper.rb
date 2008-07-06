
module JsNamedRoutes
  module AssetTagHelper
    
    def self.included(base)
      begin
        base.register_javascript_expansion :named_routes => ["named_routes"]
        base.register_javascript_include_default "named_routes"
      rescue NoMethodError
        base.send :include, InstanceMethods
        base.send :alias_method_chain, :javascript_include_tag, :js_named_routes
      end
    end
    
    module InstanceMethods
      
      def javascript_include_tag_with_js_named_routes(*sources)
        if sources.delete(:named_routes)
          sources << "named_routes"
          sources.uniq!
        elsif sources.include?(:defaults)
          sources << "named_routes"
          sources.uniq!
        end
        javascript_include_tag_without_js_named_routes(*sources)
      end
      
    end
    
  end
end