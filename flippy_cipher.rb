require "base64"

iv = Base64.strict_decode64("cEc2aTV2MWFuQ1BROTlVNg==")

source = "M4K3_LUV_N0T_W4R"
target = "MAKE_LUV_NOT_WAR"

source.chars.map.with_index do |char, index|
  k = target[index].ord ^ char.ord
  iv[index] = (iv[index].ord ^ k).chr
end

puts "CADO_" + Base64.strict_encode64(iv)
