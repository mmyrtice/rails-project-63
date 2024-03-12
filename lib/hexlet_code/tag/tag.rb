module HexletCode
  module Tag
    autoload :Single, 'hexlet_code/tag/single'
    autoload :Paired, 'hexlet_code/tag/paired'

    def self.build(tag_name, attributes = {}, &block)
      if block_given?
        Paired.build(tag_name, attributes, &block)
      else
        Single.build(tag_name, attributes)
      end
    end
  end
end
