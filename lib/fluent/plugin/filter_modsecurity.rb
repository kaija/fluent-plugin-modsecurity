# encoding: UTF-8
require 'json'

class Fluent::ModsecurityFilter < Fluent::Filter
	Fluent::Plugin.register_filter('modsecurity', self)
	def configure(conf)
		super
	end
	def filter(tag, time, record)
		print record
	end
end
