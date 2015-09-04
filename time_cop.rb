require 'timeout'
require 'open-uri'

def try_with_timeout(duration)
  begin
    Timeout.timeout(duration) do
      yield
    end
  rescue Timeout::Error
    puts 'Took too long!'
  end
end

try_with_timeout(2.0) do
  sleep 1.0
  puts 'That was refreshing.'
end

web_page = try_with_timeout(1.0) do
  open('http://example.com')
end

puts web_page.read