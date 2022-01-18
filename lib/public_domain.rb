# frozen_string_literal: true

require "nokogiri"

require_relative "public_domain/version"
require_relative "public_domain/scrapper"
require_relative "public_domain/search"

module PublicDomain
  class Error < StandardError
  end

  def self.search(item); end
end
