def with_debugging
  puts 'Got here'
  result = yield
  puts "Result was #{result}"
end


with_debugging do
  (23 - Time.now.hour) * Math::PI
end

def with_expectation(expectation)
  puts 'Running test...'
  result = yield
  expectation == answer ? puts 'Passed.' : puts 'Failed.'
end

with_expectation(4) { 2 + 2 }







