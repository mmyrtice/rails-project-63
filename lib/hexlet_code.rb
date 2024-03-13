# frozen_string_literal: true

require_relative 'hexlet_code/version'
require_relative 'hexlet_code/tag/tag'

module HexletCode
  class Error < StandardError; end

  class FormBuilder
    def initialize(entity)
      @entity = entity
    end

    def fields
      @entity.instance_variables.map do |variable|
        name = variable.to_s.delete('@')
        value = @entity.instance_variable_get(variable)
        "<input type=\"text\" name=\"#{name}\" value=\"#{value}\">"
      end.join("\n")
    end

    def input(name, **options)
      field_value = @entity.send(name)
      input_attributes = { name: name, value: field_value }.merge(options)
      tag_name = options[:as] || :input
      build_tag(tag_name, input_attributes)
    end

    private

    def build_tag(tag_name, attributes)
      attributes_string = attributes.map { |attr, value| "#{attr}=\"#{value}\"" }.join(' ')
      "<#{tag_name} #{attributes_string}></#{tag_name}>"
    end
  end

  def self.form_for(entity, url: '#')
    builder = FormBuilder.new(entity)
    yield builder
    "<form action=\"#{url}\" method=\"post\">#{builder.fields}</form>"
  end
end
