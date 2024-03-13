# frozen_string_literal: true

require_relative 'hexlet_code/version'
require_relative 'hexlet_code/tag/tag'

module HexletCode
  class Error < StandardError; end

  def self.form_for(entity, url: '#', &block)
    "<form action=\"#{url}\" method=\"post\"></form>"
  end
end
