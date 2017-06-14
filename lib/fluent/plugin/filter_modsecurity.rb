# encoding: UTF-8
require 'json'

class Fluent::ModsecurityFilter < Fluent::Filter
    Fluent::Plugin.register_filter('modsecurity', self)

    desc "Path prefix of the detail log"
    config_param :path_prefix, :string, default: "/var/log"

    def configure(conf)
        super
        @path_prefix = conf['path_prefix']
    end

    def filter(tag, time, record)
        log_path = ""
        record.each{ |key, value|
            token = value.split(" ")
            token.each { |v|
                if v.start_with?(@path_prefix)
                    log_path = v
                    break
                end
            }
        }
        file = File.read(log_path)
        data_hash = JSON.parse(file)
        record['detail'] = data_hash
        record
    end
end
