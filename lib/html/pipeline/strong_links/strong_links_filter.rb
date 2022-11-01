module HTML
  class Pipeline
    class StrongLinksFilter < TextFilter
      def call
        doc = Nokogiri::HTML::DocumentFragment.parse(@text)
        doc.search("a").each do |element|
          next if element.blank? || element.comment?
          next if element["href"].to_s.empty?

          element["rel"] = "noopener noreferrer"
          element["target"] = "_blank"
          element["data-turbo"] = "false"
          unless element["href"].to_s.start_with?("http")
            # We have to create a new node from scratch in order to do a
            # replacement which will effectively strip the anchor from the doc.
            new_node = Nokogiri::XML::Text.new(element.inner_html, doc)
            element.replace(new_node)
          end
        end

        doc
      end
    end
  end
end
