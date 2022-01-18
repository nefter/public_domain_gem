# frozen_string_literal: true

require "net/http"
require "nokogiri"

module PublicDomain
  class Scrapper
    attr_reader :uri

    def initialize(path)
      @uri = URI.join("https://www.gutenberg.org", path)
    end

    def document
      @document ||= Nokogiri::HTML(raw_data)
    end

    private

    def raw_data
      @raw_data ||= response.body
    end

    # protected

    def response
      @response ||= Net::HTTP.get_response(uri)
    end
  end
end
