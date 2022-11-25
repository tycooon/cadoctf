require "base64"

encoded = "LOA2MKtx9S/nlcNW+Li3wmQI"
time = Time.now.to_i

loop do
  time -= 1

  srand(time)

  flag = Base64.strict_decode64(encoded).bytes.map { |x| (x.ord ^ (rand() * 256).to_i).chr }.join

  if flag.start_with?("CADO")
    puts flag
    break
  end
end
