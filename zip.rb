require "base64"
require "fileutils"

result = `zipinfo ~/Downloads/super_secret-1.zip`

FileUtils.mkdir_p("data/zip")

23.times do |i|
  File.write("./data/zip/#{i}.txt", "0")
end

# pp ints = result.scan(/(\d+)\.txt/).flatten.map(&:to_i)

# r = {}

# ints.each_with_index do |x, i|
#   r[x] = i
# end

# pp a = r.sort.map(&:last)

# puts Base64.strict_encode64(a.map(&:chr).join)
