module HexletCode
  module Tag
    module Single
      def self.build(tag, attributes = {})
        attributes_string = attributes.map { |attr, value| "#{attr}=\"#{value}\"" }.join(' ')
        "<#{tag} #{attributes_string}>"
      end
    end
  end
end
