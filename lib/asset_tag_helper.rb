module ActionView::Helpers::AssetTagHelper
  alias_method :old_javascript_include_tag, :javascript_include_tag

  JAVASCRIPT_DEFAULT_SOURCES = ['named_routes']
  @@javascript_default_sources = JAVASCRIPT_DEFAULT_SOURCES.dup

  def javascript_include_tag(*sources)
    if sources.delete :named_routes
      sources = sources.concat(
      ['named_routes']
      ).uniq
    elsif sources.delete :defaults
      sources = ['named_routes'].concat(sources)
    end

    old_javascript_include_tag(*sources)
  end
end