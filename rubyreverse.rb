m = [16, 45, 67, 10, 12, 184, 220]
r = [3, 2, 4, 1, 0]
b = 0
t = "SADf8askdfss2efg"
v = "5f691c4b4f496f1c7f5e555b114f7e3409262e28"

flag = {}

v.chars.each_slice(2).with_index do |chunk, i|
  k = chunk.join.to_i(16)
  t[i % 5] = (t[i % 5].ord - 2).chr
  flag[i/5 * 5 + r[i % 5]] = (k ^ m[i % 5]).chr
end

puts flag.sort.map(&:last).join
