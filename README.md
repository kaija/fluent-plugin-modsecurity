# fluent-plugin-modsecurity
fluentd plugin for modsecurity log

[![Build Status](https://travis-ci.org/kaija/fluent-plugin-modsecurity.svg?branch=master)](https://travis-ci.org/kaija/fluent-plugin-modsecurity)


# td-agent config


```
# (1) Consume the input by tail and tag modsecurity
<source>
    type tail
    tag modsecurity
    format /^(?<host>[^ ]*) (?<remote_addr>[^ ]*) (?<remote_user>[^ ]*) (?<local_user>[^ ]*) \[(?<timestamp>[^\]]*)\] "(?<method>\S+)(?: +(?<path>[^\"]*) +\S*)?" (?<status_code>[^ ]*) (?<body_bytes_sent>[^ ]*) "(?<message>.*)$/
    time_format %d/%b/%Y:%H:%M:%S %z
    pos_file /var/log/td-agent/modsec_audit2.log.pos
    path /var/log/modsec/audit.log
</source>

# (2) retreive detail log from each record and append back to record
<filter modsecurity>
    type modsecurity
    path_prefix /var/log
</filter>

# (3) append geoip information (optional)
<match modsecurity>
    type geoip
    geoip_lookup_key transaction.client_ip
    enable_key_country_code geoip_country
    enable_key_city         geoip_city
    enable_key_latitude     geoip_lat
    enable_key_longitude    geoip_lon
    remove_tag_prefix       test.
    add_tag_prefix          geoip.
    flush_interval          5s
</match>

# (3) Output

<match geoip.modsecurity>
    type elasticsearch
    include_tag_key true
    log_level info
    logstash_format true
    logstash_prefix modsecurity_geo
    type_name blocked
    buffer_chunk_limit 1M
    buffer_queue_limit 32
    flush_interval 30s
    host 192.168.1.2
    port 9200
</match>
```


