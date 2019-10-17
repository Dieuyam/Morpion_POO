



############################################################
################classe PLAYER###############################
############################################################

#la classe Player permet de définir le joueur

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
