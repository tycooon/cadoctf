require "socket"

SOCKET = TCPSocket.new("pwn.cadoctf.cloud", 11337)

def read!
  result = +""

  loop do
    result << SOCKET.read_nonblock(256).force_encoding("utf-8")
    break if result.include?("Выбирай: ")
  rescue IO::EAGAINWaitReadable
    sleep 0.1
    retry
  rescue EOFError
    break
  end

  print result
  result
end

def write!(string)
  puts string
  SOCKET.puts(string)
end

read!

File.open("./coin.txt", "w") do |file|
  file.sync = true

  624.times do
    write!("О")
    read!
    seed, result = result.match(/выдает (\d+).+(орел|решка)/).values_at(1, 2)
    file.puts(seed)
  end
end

`rm predicted.txt && cat coin.txt | mt19937predict | head -n 100 > predicted.txt`

File.open("predicted.txt", "r") do |file|
  100.times do
    line = file.gets
    answer = line.to_i.even? ? "О" : "Р"
    write!(answer)
    read!
  end
end
