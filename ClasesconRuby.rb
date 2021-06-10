class Perro
  def initialize(reza,nombre)
    @raza = reza
    @nombre = nombre
    @lenRaz = reza.length
  end

    def ladrar
      puts "Wow"
    end

    def saludar
      puts "Soy un perro de la raza #{@raza} y mi nombre es #{@nombre}"
    end
    def verque
      p "La logitud es #{@lenRaz}"
    end
end

class Shiritori
  attr_accessor :words
  attr_accessor :game_over
  def initialize
    @words = []
    @game_over = false
  end

  def play(word)
    if @words.length == 0
      @words << word
    else
      if @words[@words.length-1][@words[@words.length-1].length-1]==word[0]
        @words << word
        p @words
      else
        p "Game Over"
        restart()
      end
    end
  end

  def restart()
    @game_over = true
    @words=[]
  end

end

my_shiritori = Shiritori.new()
my_shiritori.play("apple")# ➞ ["apple"]
my_shiritori.play("ear") #➞ ["apple", "ear"]
my_shiritori.play("rhino")# ➞ ["apple", "ear", "rhino"]
