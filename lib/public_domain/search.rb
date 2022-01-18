# frozen_string_literal: true

module PublicDomain
  class Search < Scrapper
    def initialize(item)
      super("/ebooks/search/?#{URI.encode_www_form({ query: item })}")
    end

    def results
      results ||= document.css(".booklink").map do |node|
        {
          title: node.css(".title")&.text,
          author: node.css(".subtitle")&.text,
          downloads: node.css(".extra")&.text&.scan(/(\d+)\sdownloads/)&.flatten&.first&.to_i,
          path: "https://www.gutenberg.org"+node.css(".link")&.attribute("href")&.value
          # path: URI
        }
      end
    end
  end
end
