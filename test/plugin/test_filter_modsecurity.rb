require 'helper'
class ModsecurityFilter < Test::Unit::TestCase
	CONFIG = %[
	]
	def setup
		Fluent::Test.setup
	end
	def create_driver(conf = CONFIG, tag='test.input')
		Fluent::Test::FilterTestDriver.new(Fluent::ModsecurityFilter, tag).configure(conf)
	end
end
