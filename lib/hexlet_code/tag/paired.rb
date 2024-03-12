module HexletCode
  module Tag
    module Paired
      def self.build(tag, attributes = {}, &block)
        attributes_string = attributes.map { |attr, value| "#{attr}=\"#{value}\"" }.join(' ')
        content = block_given? ? yield : ''
        "<#{tag} #{attributes_string}>#{content}</#{tag}>"
      end
    end
  end
end
