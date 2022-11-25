gem "parallel"

require "digest"
require "parallel"

BLOCK = %({"from":"kristech","to":"Umbrellio","amount":1000000,"currency":"UMBT"})
PREFIX = "0" * 7

i = 0

loop do
  puts i if (i % 10_000_000).zero?
  md5 = Digest::MD5.hexdigest(BLOCK + i.to_s)
  break if md5.start_with?(PREFIX)
  i += 1
end

puts "CADO_#{i}"
