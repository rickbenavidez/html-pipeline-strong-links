require "html/pipeline"
require "html/pipeline/strong_links/version"
require "html/pipeline/strong_links/strong_links_filter.rb"

module HTML
  class Pipeline
    autoload :StrongLinksFilter, 'html/pipeline/strong_links/strong_links_filter'
  end
end
