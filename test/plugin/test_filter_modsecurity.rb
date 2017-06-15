require 'helper'

class ModsecurityFilter < Test::Unit::TestCase

	def setup
		Fluent::Test.setup
        require 'fluent/plugin/filter_modsecurity'
        @driver = nil
	end

    def driver(tag='test', config='')
        @driver ||= Fluent::Test::FilterTestDriver.new(Fluent::ModsecurityFilter, tag).configure(config)
    end

    def test_configure
        config = %{
            path_prefix /var/log
        }
        instance = driver('test', config).instance
        path = instance.path_prefix
        assert_equal "/var/log", path
    end
end
