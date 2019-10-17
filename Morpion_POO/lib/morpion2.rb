



############################################################
################classe PLAYER###############################
############################################################

#la classe Player permet de définir le joueur: son nom et son jeton
class Player
  attr_accessor :name, :symbol




  def initialize(name, symbol, board)
      @name = name
      @symbol = symbol
      @board = board
  end



  def move(cell)   #méthode permettant de mettre à jour les cellules à partir du joueur
    @board.update_cell(cell, self.symbol)
  end




  def winner?   #permet de faire une boucle sur toutes les combinaisons gagnantes et de s'assurer que les trois symboles d'un meme joueur sont à la suite
    wins = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8],
            [0, 4, 8], [2, 4, 6]]
    wins.each do |win|
      values = [cells[win[0]], cells[win[1]], cells[win[2]]]
      return true if values.include?(self.symbol.to_s) &&
      ((values[0] == values[1]) && (values[1] == values[2]))
    end
    false
  end

  #private
#permet de lier les cellules à la classe joueur




  def cells  #permet de récupérer  les cellules liées la classe joueur
    @board.cells
  end


end  #fin de la classe Player




  

############################################################
################classe BOARD################################
############################################################


# Classe définissant le plateau de jeu
class Board
  attr_accessor :cells



    def initialize
    
      @cells = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
  end







#Affichage du corps du tableau (valeurs de base + lignes verticales et horizontales)
  def update_cell(number, symbol)
    if cell_free?(number)
      self.cells[number - 1] = symbol.to_s
      show_board
    else
      puts "la case est occupée choisis une autre case"
      return false
    end
  end





def show_board     #la fonction affiche le tableau çi-dessous :
                   

                      #   1  │ 2 │ 3
                    #     ───┼───┼───
                    #      4 │ 5 │ 6
                    #     ───┼───┼───
                    #      7 │ 8 │ 9

      hline = "\u2502"    #affiche "│" 
      vline = "\u2500"    #affiche "─"
      cross = "\u253C"    #affiche "┼" 
      row1 = " " + self.cells[0..2].join(" #{hline} ")    # affiche " 1 │ 2 │ 3"
      row2 = " " + self.cells[3..5].join(" #{hline} ")      # affiche " 4 │ 5 │ 6"
      row3 = " " + self.cells[6..8].join(" #{hline} ")   # affiche " 6 │ 7 │ 8"
      separator = vline * 3 + cross + vline * 3 + cross + vline * 3 #affiche "───┼───┼───"
      system("clear")
      puts row1
      puts separator
      puts row2
      puts separator
      puts row3
end





def cell_free? (number)   #cette méthode permet de savoir la cellule est libre et renvoie un booléen si elle est libre
  cell = self.cells[number - 1]
    if cell == "X"  || cell == "O"
      false
    else 
      true
    end

end



end  #fin de la classe Board




############################################################
################classe GAME#################################
############################################################


#Cette classe permet de mettre en place le jeu et de le lancer avec des valeurs de base
class Game

  def initialize
    @board = Board.new
    @current_player = ""
    @winner = false
    @turn = 0
  end
#
 




  def turn   # méthode pour jouer peut entrer un nombre compris entre 1 et 9, si le nombre n'est pas compris dans cet intervalle un message s'affiche demandant de redonner une valeur.
    puts "C'est le tour de #{@current_player.name} Choisis une case entre 1 et 9: "
    choice = gets.chomp.to_i
    if choice > 9 || choice < 1
      puts "Attention le nombre doit être en 1 et 9"
    elsif @current_player.move(choice) != false
      @winner = @current_player if @current_player.winner?
      @turn += 1
      switch_player
    end
  end





  def switch_player   # Méthode permettant de mettre en place les changement de joueur
    @current_player = @current_player == @player1 ? @player2 : @player1
  end




  def get_names   #Méthode permettant d'obtenir le nom des joueurs, on utilise le gest.chomp
    puts "Quel est le nom du premier joueur? "
    name1 = gets.chomp
    puts "Quel est le nom du deuxième joueur? : "
    name2 = gets.chomp
    [name1, name2]
  end





  def start_game  #Méthode permettant de lancer le jeu et de démarrer la partie
      names = get_names
      @player1 = Player.new(names[0], :X, @board)
      @player2 = Player.new(names[1], :O, @board)
      @current_player = @player1
      @board.show_board
      turn until @winner || @turn == 9
      if @winner
        puts "Et le vainqueur est #{@winner.name}!"
      else
        puts "Draw!"
      end
  end



end   #fin de classe game 




############################################################
################LANCEMENT###################################
############################################################

game = Game.new
game.start_game
