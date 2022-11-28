require "openssl"
require "prime"

enc_flag = File.read("data/flag.enc")

key = OpenSSL::PKey::RSA.new(File.read("./data/pubKey"))
pp modulus = key.params.fetch("n").to_i
# modulus = 32201231212312

def sqrt(x)
  return 0 if x == 0

  m = x
  p = x

  loop do
    r = (m + p / m) / 2
    return m if m <= r
    m = r
  end
end

def factorize(n)
  time = Time.now

  x = sqrt(n)
  x += 1 if x.even?

  loop do
    p x
    # if Time.now - time > 10
    #   p x
    #   time = Time.now
    # end

    if Prime.prime?(x)
      require 'pry'; binding.pry
      y = n.to_f / x
      return [x, y.floor] if y == y.floor
    end

    x -= 2
  end
end

pp factorize(modulus)
