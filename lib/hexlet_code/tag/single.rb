# frozen_string_literal: true

module HexletCode::Tag::Single
  def self.build(tag, attributes = {})
    attributes_string = attributes.map { |attr, value| "#{attr}=\"#{value}\"" }.join(' ')
    "<#{tag} #{attributes_string}>"
  end
end
