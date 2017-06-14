# encoding: UTF-8
require 'json'

class Fluent::ModsecurityFilter < Fluent::Filter
    Fluent::Plugin.register_filter('modsecurity', self)
    def configure(conf)
        super
    end
    def filter(tag, time, record)
        print record['message']
        message = record['message']
        list = message.split(" ")
        file = File.read(list[5])
        data_hash = JSON.parse(file)
        data_hash
    end
end
