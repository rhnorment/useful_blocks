require 'timeout'

Timeout.timeout(2.0) do
  sleep 1.0
  puts 'That was refreshing...'
end