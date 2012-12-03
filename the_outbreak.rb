class Game
  def initialize(start)
    @start = start
  end

  def prompt
	"What do you do? > "
  end

  def play()
    next_move = @start

    while true
      puts "\n--------"
      room = method(next_move)
      next_move = room.call()
    end
  end

  def dead()
  	puts "I can't believe you died!"
  	Process.exit(1)
  end
  
  def suvivors
  	puts "you survived! you want a cookie?"
  	Process.exit(1)
  end
  def the_outbreak()
     puts "The Outbreak!"
     print "Choose your name: "; @name = gets.chomp()
     puts
     puts
     puts"-----------"
     puts "#{@name} is sitting at home playing"
     puts "videogames when he suddenly heres a scream."
     puts "He recognizes that is it is his mother! "
     puts "---------"
     puts "1) Go down stairs and check it out."
     puts "2) Believe its nothing and Continue to play video games."
     puts "3) You take your Katana from your collection."

     print prompt; scream = gets.chomp

	 if scream.include? "1"
	      puts "You got attacked by a Zombie!"
	      return :dead
 
     elsif scream.include? "2"
	      puts
	      puts
	      puts "I can't believe you didn't check on your Mom."
	      puts "The Zombie attacks you while your playing."
	      return :dead
     elsif scream.include? "3"
	      puts "You walk downstairs and see your Mom get chased by zombies."
	      return :save
	 end
   end

   def save
   	  puts "1) Try and kill the Zombies with your Katana."
      puts "2) Scream like a little girl."
      puts "3) Distract the zombies"
      prompt; save = gets.chomp()
   	  if save.include? "1"
   	  	puts "Theres to many of them you and your mom die."
   	  	return :dead
   	  elsif save.include? "2"
   	  	puts "They hear your feminine scream and attack you."
   	  	return :dead
   	  end
   end

   def distract
   	   puts "1) You come back and grab your mom and leave"
   	   puts "2) You use your Katana to try and kill them all."
      
       if distract.include? "1"
       	  puts "You and your Mom run next door to your neighbors for refuge."
       	  puts "You survived"
       	  return :suvivors
       elsif distract.include? "2"
       	  puts "You died trying to kill the Zombies."
       	  return :dead
       end
   end
end



new_game = Game.new(:the_outbreak)
new_game.play
