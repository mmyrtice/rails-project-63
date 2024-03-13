# frozen_string_literal: true

$LOAD_PATH.unshift File.expand_path('../lib', __dir__)
require 'hexlet_code'

require 'minitest/autorun'
require 'minitest/spec'

class User
  attr_accessor :name, :job, :gender

  def initialize(name:, job:, gender:)
    @name = name
    @job = job
    @gender = gender
  end
end

describe HexletCode do
  it 'generates form fields with default types and values' do
    user = User.new(name: 'rob', job: 'hexlet', gender: 'm')
    form = HexletCode.form_for(user) do |f|
      f.input :name
      f.input :job, as: :text
      f.input :gender
    end

    expected_form = '<form action="#" method="post">' \
                  '<input type="text" name="name" value="rob">' \
                  '<textarea name="job" cols="20" rows="40">hexlet</textarea>' \
                  '<input type="text" name="gender" value="m">' \
                  '</form>'

    expect(form).must_equal expected_form
  end

  it 'generates form fields with additional attributes' do
    user = User.new(name: 'rob', job: 'hexlet', gender: 'm')
    form = HexletCode.form_for(user, url: '#') do |f|
      f.input :name, class: 'user-input'
      f.input :job
    end

    expected_form = '<form action="#" method="post">' \
                    '<input name="name" type="text" value="rob" class="user-input">' \
                    '<input name="job" type="text" value="hexlet">' \
                    '</form>'

    expect(form).must_equal expected_form
  end

  it 'generates form fields with custom types and attributes' do
    user = User.new(name: 'rob', job: 'hexlet', gender: 'm')
    form = HexletCode.form_for(user) do |f|
      f.input :job, as: :text, rows: 50, cols: 50
    end

    expected_form = '<form action="#" method="post">' \
                    '<textarea cols="50" rows="50" name="job">hexlet</textarea>' \
                    '</form>'

    expect(form).must_equal expected_form
  end

  it 'raises an error if the field does not exist in the object' do
    user = User.new(name: 'rob', job: 'hexlet', gender: 'm')
    expect do
      HexletCode.form_for(user, url: '/users') do |f|
        f.input :age
      end
    end.must_raise NoMethodError
  end

  puts 'All tests were executed successfully!'
end
