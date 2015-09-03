scores = [83, 71, 92, 64, 98, 87, 75, 69]

p scores_doubled = scores.map { |s| s * 2 }

p total = scores.reduce(0, :+)

evens, odds = scores.partition { |s| s.even? }
p evens
p odds