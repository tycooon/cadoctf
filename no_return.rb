require "socket"

SOCKET = TCPSocket.new("pwn.cadoctf.cloud", 1337)

def read!(substring = "\0")
  result = +""

  loop do
    result << SOCKET.read_nonblock(256).force_encoding("utf-8")
    break if result.include?(substring)
  rescue IO::EAGAINWaitReadable
    sleep 0.1
    retry
  rescue EOFError
    p :EOFError
    break
  end

  print result
  result
end

def write!(string)
  puts string
  SOCKET.puts(string)
end

read!("Enter the password:")

write!("kdsjfklsdjlkfjsdklfa")

read!
