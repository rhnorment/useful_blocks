def deal(number)
  faces = ['Jack', 'Queen', 'King', 'Ace']
  suits = ['Hearts', 'Diamonds', 'Spades', 'Clubs']

  if block_given?
    1.upto(number) do
      random_face = faces.sample
      random_suit = suits.sample
      score = yield(random_face, random_suit)
      puts "You scored a #{score}!"
    end
  else
    puts 'No deal!'
  end
end

deal(10) do |face, suit|
  puts "Dealt a #{face} of #{suit}"
  face.length + suit.length
end



