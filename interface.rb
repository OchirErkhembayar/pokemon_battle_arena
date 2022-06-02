require './pokemon_class'

pikachu_stats = {
  name: "Pikachu",
  attack: 26,
  block_chance: 15,
  health: 100
}

charizard_stats = {
  name: "Charizard",
  attack: 32,
  block_chance: 10,
  health: 100
}

pikachu = Pokemon.new(pikachu_stats)
charizard = Pokemon.new(charizard_stats)
system "clear"
puts "    "
puts "*********************"
puts "Pikachu vs. Charizard"
puts "*********************"

turn = (1..2).to_a.sample.even? ? 1 : 2

while pikachu.health > 0 && charizard.health > 0
  puts " "
  puts "Pikachu's stats: "
    puts "  Health: #{pikachu.health}HP"
    puts "  Damage: 1-#{pikachu.damage}HP"
    puts "  Block chance: #{pikachu.block_chance}%"
    puts "Charizard's stats:"
    puts "  Health: #{charizard.health}HP"
    puts "  Damage: 1-#{charizard.damage}HP"
    puts "  Block chance: #{charizard.block_chance}%"
  puts " "
  if turn.odd?
    puts "Pikachu, choose your action!"
  else
    puts "Charizard, choose your action!"
  end
  puts "1. Attack!"
  puts "2. Defend! (Increase block chance by 30% SINGLE USE)"
  puts "3. Heal!"
  puts "4. Stun attack! (Weaker attack with chance to stun)"
  puts "5. Flee!"
  action = gets.chomp.to_i
  system "clear"
  puts " "
  case action
  when 1
    turn.odd? ? pikachu.attack(charizard) : charizard.attack(pikachu)
    turn += 1
  when 2
    if (turn.odd? ? pikachu.defend : charizard.defend) == 0
      turn += 1
    else
      turn += 0
    end
  when 3
    turn.odd? ? pikachu.heal : charizard.heal
    turn += 1
  when 4
    if (turn.odd? ? pikachu.stun(charizard) : charizard.stun(pikachu)) == 0
      turn += 1
    end
  when 5
    turn.odd? ? pikachu.flee(charizard) : charizard.flee(pikachu)
    puts "Thanks for playing!"
    return
  else
    puts "Incorrect input, try again"
  end
end

puts "Thanks for playing!"
