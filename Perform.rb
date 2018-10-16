#on fait appel au fichier externe ClassPlayer qui contient toutes les classes
require_relative 'Classes.rb'

def start_game
  puts "quel est le prenom du joueur 1?"
  input1 = gets.chomp
  puts "quel est le prenom du joueur 2?"
  input2 = gets.chomp
  # on demande les noms des joueurs, ensuite on recupere dans board l'instance de classe Board, et on cree le Game avec les noms et le game
  board = Board.new
  return game = Game.new(input1, input2, board)
end

def show_board(board)
  # fonction d'affichage simple
  puts
  puts "   1   2   3"
  puts "A  #{board.array_cases[0].content} | #{board.array_cases[1].content} | #{board.array_cases[2].content} " 
  puts "  ---|---|---"
  puts "B  #{board.array_cases[3].content} | #{board.array_cases[4].content} | #{board.array_cases[5].content} "
  puts "  ---|---|---"
  puts "C  #{board.array_cases[6].content} | #{board.array_cases[7].content} | #{board.array_cases[8].content} "
  puts
end

def play(plateau, joueur1, joueur2)
  count_turn = 0
  while count_turn < 9
    puts "#{joueur1.first_name}, a toi de jouer"
    input = gets.chomp.to_i
    plateau.array_cases[input].content = "X"
    show_board(plateau)
    count_turn += 1
  end
end
def perform
  # on commence par appeller start_game
  my_game = start_game
  # affichage jeu
  show_board(my_game.board)
  # facultatif ? board.all_cases
  play(my_game.board, my_game.array_players[0], my_game.array_players[1])

  # my_game.board.array_cases[0].content = "X" 
  show_board(my_game.board)

 # my_game.content = symbol

end

perform