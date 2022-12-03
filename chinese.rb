MODS = [0xab1cda1, 0x355f85, 0xbde3]
VALUES = [0xa4d49c6a79ee87d4, 0x2d3617313050bbca, 0xd3fa380132ca2a76]

def to_bits(x) = x.to_s(2).rjust(64, "0")
def from_bits(x) = x.to_i(2)

VALUES.each do |value|
  # MODS.each { |x| p to_bits(x).gsub(/^0+/, "").size }
  # Result is 38, 22, 16 so reminder sizes should be 26, 22, 16 since they go from right to left

  bits = to_bits(value)
  reminders = [bits[0, 26], bits[26, 22], bits[48, 16]]

  abort("Reminders don't match the value!") unless bits == reminders.join

  reminders.map! { |rem| from_bits(rem) }
  reminders[0] |= 0x4000000

  puts "ChineseRemainder[{#{reminders.join(", ")}}, {#{MODS.join(", ")}}]"
end

# Calculated at https://www.wolframcloud.com/:
results = [3560169582067204419, 7882797292454176078, 2604246558270836273]

strings = results.map do |result|
  to_bits(result).chars.each_slice(8).map { |x| from_bits(x.join).chr }.reverse.join
end

puts strings.join
