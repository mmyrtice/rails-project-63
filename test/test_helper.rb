# frozen_string_literal: true

$LOAD_PATH.unshift File.expand_path('../lib', __dir__)
require 'hexlet_code'

require 'minitest/autorun'
require 'minitest/spec'

class User
  attr_accessor :name

  def initialize(name:)
    @name = name
  end
end

describe HexletCode do
  it 'generates an empty form' do
    user = User.new(name: 'John')
    form = HexletCode.form_for(user) { |f| }
    expect(form).must_equal('<form action="#" method="post"></form>')
  end

  it 'generates a form with a custom URL' do
    user = User.new(name: 'John')
    form = HexletCode.form_for(user, url: '/users') { |f| }
    expect(form).must_equal('<form action="/users" method="post"></form>')
  end

  puts 'All tests were executed successfully!'
end
