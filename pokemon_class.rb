class Pokemon
  attr_accessor :health, :block_chance
  attr_reader :name, :damage

  def initialize(args)
    @name = args[:name]
    @damage = args[:attack]
    @block_chance = args[:block_chance]
    @health = args[:health]
  end

  def attack(enemy)
    if (1..100).to_a.sample >= enemy.block_chance
      puts "#{@name} attacks #{enemy.name}!"
      damage = (10..@damage).to_a.sample
      enemy.health -= damage
      puts "#{@name}'s attack lands for #{damage} damage!"
      if enemy.health <= 0
        return puts "#{enemy.name} has been defeated!"
      end
      return puts "#{enemy.name} has #{enemy.health} health remaining!"
    end
    puts "#{enemy.name} blocks the attack!"
  end

  def defend
    if @block_chance <= 25
      puts "#{@name} increases their block chance by 20!"
      @block_chance += 30
      puts "#{@name}'s block chance is now #{@block_chance}"
      return 0
    end
    puts "Defend already used!"
    return 1
  end

  def heal
    heal = (10..14).to_a.sample
    @health += heal
    puts "#{@name} heals #{heal}HP!"
    puts "New HP: #{@health}"
  end

  def stun(enemy)
    enemy.health -= 7
    puts "#{@name} uses a stun attack and deals 7 damage!"
    puts "#{enemy.name} has #{enemy.health} health remaining!"
    if (1..10).to_a.sample > 7
      puts "#{enemy.name} has been stunned!"
      return 1
    end
    puts "#{enemy.name} avoids the stun!"
    return 0
  end

  def flee(enemy)
    puts "#{@name} runs away! Shameful!"
    puts "#{enemy.name} is victorious!"
  end
end
