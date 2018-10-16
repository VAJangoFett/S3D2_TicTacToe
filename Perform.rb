#on fait appel au fichier externe ClassPlayer qui contient toutes les classes
require_relative 'ClassPlayer'

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

def victory(plateau)
    winning_positions = [["A1","A2","A3"],["B1", "B2", "B3"],["C1", "C2", "C3"],["A1", "B2", "C3"],["A3", "B2", "C1"],["A1", "B1", "C1"],["A2", "B2", "C2"],["A3", "B3", "C3"]]
    winning_positions.each do |element|
      return true if element.all? {|x| plateau.array_cases[x.to_i] == "X"}
      return true if element.all? {|x| plateau.array_cases[x.to_i] == "O"}
    end
      return false
  end

#   if condition
#     return true
#   elsif cond
#     return true
#   else
#   return false
# end

def barbare_encore(plateau)
  if plateau.array_cases[0].content == "X" && plateau.array_cases[1].content == "X" && plateau.array_cases[2].content == "X" || plateau.array_cases[3].content == "X" && plateau.array_cases[4].content == "X" && plateau.array_cases[5].content == "X" || plateau.array_cases[6].content == "X" && plateau.array_cases[7].content == "X" && plateau.array_cases[8].content == "X" || plateau.array_cases[0].content == "X" && plateau.array_cases[3].content == "X" && plateau.array_cases[6].content == "X" || plateau.array_cases[1].content == "X" && plateau.array_cases[4].content == "X" && plateau.array_cases[7].content == "X" || plateau.array_cases[2].content == "X" && plateau.array_cases[5].content == "X" && plateau.array_cases[8].content == "X" || plateau.array_cases[0].content == "X" && plateau.array_cases[4].content == "X" && plateau.array_cases[8].content == "X" || plateau.array_cases[2].content == "X" && plateau.array_cases[4].content == "X" && plateau.array_cases[6].content == "X"
    puts "player1 win"
    return true
  elsif plateau.array_cases[0].content == "O" && plateau.array_cases[1].content == "O" && plateau.array_cases[2].content == "O" || plateau.array_cases[3].content == "O" && plateau.array_cases[4].content == "O" && plateau.array_cases[5].content == "O" || plateau.array_cases[6].content == "O" && plateau.array_cases[7].content == "O" && plateau.array_cases[8].content == "O" || plateau.array_cases[0].content == "O" && plateau.array_cases[3].content == "O" && plateau.array_cases[6].content == "O" || plateau.array_cases[1].content == "O" && plateau.array_cases[4].content == "O" && plateau.array_cases[7].content == "O" || plateau.array_cases[2].content == "O" && plateau.array_cases[5].content == "O" && plateau.array_cases[8].content == "O" || plateau.array_cases[0].content == "O" && plateau.array_cases[4].content == "O" && plateau.array_cases[8].content == "O" || plateau.array_cases[2].content == "O" && plateau.array_cases[4].content == "O" && plateau.array_cases[6].content == "O"
      puts "player2 win"
      return true
  else
    return false
  end

end
def play(plateau, joueur1, joueur2)
  count_turn = 0
  game_run = true

  #while game_run

    while game_run
      if count_turn.even?
        puts "#{joueur1.first_name}, a toi de jouer"
        verif = gets.chomp.capitalize
        input = barbare_function(verif)
        if plateau.array_cases[input.to_i].content == " "
          plateau.array_cases[input.to_i].content = "X"
          show_board(plateau)
          count_turn += 1
          if  barbare_encore(plateau) == false && count_turn == 9
            puts "Match nul"
            exit
          elsif  barbare_encore(plateau) || count_turn == 9
            game_run = false
          end
          # puts count_turn

        else
          puts "case prise, tentative de triche retente sans tricher cette fois"
        end

      else
        puts "#{joueur2.first_name}, a toi de jouer"
        verif = gets.chomp.capitalize
        input = barbare_function(verif)
        if plateau.array_cases[input.to_i].content == " "
          plateau.array_cases[input.to_i].content = "O"
          show_board(plateau)
          count_turn += 1
           if count_turn == 9 || barbare_encore(plateau)
            game_run = false
          end
          # puts count_turn
        else
          puts "case prise, tentative de triche retente sans tricher cette fois"
        end
    #   puts "#{joueur2.first_name}, a toi de jouer"
    #   # input = barbare_function.to_i
    #   plateau.array_cases[input].content = "O"
    #   show_board(plateau)
    #   count_turn += 1
      end
    end

  #end
end

def barbare_function(input)
  # input = gets.chomp.capitalize
  if input == "A1"
    return "0"
      elsif input == "A2"
    return "1"
      elsif input == "A3"
    return "2"
      elsif input == "B1"
    return "3"
      elsif input == "B2"
    return "4"
      elsif input == "B3"
    return "5"
      elsif input == "C1"
    return "6"
      elsif input == "C2"
    return "7"
      elsif input == "C3"
    return "8"
  else
    puts "mauvaise entree, reesayer"
    # barbare_function
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
