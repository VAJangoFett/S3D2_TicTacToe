class Player
  # on initialise player avec un nom et un symbole, X ou O
  attr_reader :first_name, :symbol
  def initialize(first_name, symbol)
    @first_name = first_name
    @symbol = symbol
    puts "#{first_name} sera les #{symbol}"
  end
end

class Board
  # on cree le plateau avec un array comprenant 9 cases  
  attr_reader :array_cases
  def initialize
    my_board = ["A1", "A2", "A3", "B1", "B2", "B3", "C1", "C2", "C3"]
    @array_cases = []
    # pour chaque cases, on cree un Boardcase qui sera initialise dans la classe Boardcase
    my_board.each do |case_str|
      @array_cases << BoardCase.new(case_str)
    end
  end
end

class BoardCase
  # il initialise le tableau avec 9 cases de valeur "vide" que l'on pourra remplacer par la suite
  attr_accessor :content, :position
  def initialize(position)
    @position = position #string du style "A2" ou "B3"
    @content = " "
  end
end

class Game
  attr_reader :board, :array_players
  # on cree la partie, avec 3 arguments, 2 pour les noms des joueurs, et 1 avec le board
  def initialize(first_name1, first_name2, board)
    @board = board
    #on initialise les players avec les signes x et o
    player1 = Player.new(first_name1, "X")
    player2 = Player.new(first_name2, "O")
    #tableau des joueurs, peut etre a supprimer
    @array_players = [player1, player2]
    #nombre de tour pour finir le jeu apres 9 coups, current player pour definir qui joue
    @turn_count = 1
    @current_player = player1
  end

end