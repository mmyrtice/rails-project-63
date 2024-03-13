install:
	bundle install

lint:
	rubocop

test:
	bundle exec ruby -Itest test/test_helper.rb
