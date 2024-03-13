# frozen_string_literal: true

module HexletCode::Tag::Paired
  def self.build(tag, attributes = {}, _block)
    attributes_string = attributes.map { |attr, value| "#{attr}=\"#{value}\"" }.join(' ')
    content = block_given? ? yield : ''
    "<#{tag} #{attributes_string}>#{content}</#{tag}>"
  end
end
