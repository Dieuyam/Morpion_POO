
############################################################
################classe GAME#################################
############################################################


#Cette classe permet de mettre en place le jeu 
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
      puts "Attention le nombre doit être compris entre 1 et 9"
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
