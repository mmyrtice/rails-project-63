# frozen_string_literal: true

require_relative 'hexlet_code/tag/single'
require_relative 'hexlet_code/tag/paired'
include HexletCode::Tag::Single
include HexletCode::Tag::Paired

# Генерация одиночного тега
puts Single.build('img', src: 'path/to/image')

# Генерация парного тега с содержимым
puts Paired.build('div') { 'Hello, World!' }

# Генерация парного тега без содержимого
puts Paired.build('p', class: 'paragraph')
