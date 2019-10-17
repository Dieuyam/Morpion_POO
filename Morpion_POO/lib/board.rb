
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
