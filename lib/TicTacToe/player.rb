# frozen_string_literal: true

module TicTacToe
  class Player 
    attr_reader :symbol

    def initialize(symbol)
      @symbol = symbol
    end

    def play1(newboard, moves, player1, winner, turn)
        #puts "#{newboard.dimensions}"
        print '1st Player writes the position:'
        move = gets.chomp
        move = verification(move, newboard.dimxdim, 1)
        newboard.dimxdim[move.to_i] = player1.symbol
        moves.dimxdim[turn.to_i] = 1
        # winner = Board.win_com(newboard.dimxdim, player1, newboard.dimensions)
        Board.printboard(newboard.dimensions,newboard.dimxdim)
    end

    def play2(newboard, moves, player1, turn, winner, player2)
      #if game.winner != player1
            turn += 1 
        if turn != ((newboard.dimensions * newboard.dimensions))
            print '2nd Player writes the position:'
            move = gets.chomp
            move = verification(move, newboard.dimxdim, 2)
            newboard.dimxdim[move.to_i] = player2.symbol
            moves.dimxdim[turn] = 1
            # winner = decide(board, player2, dimensions)
            Board.printboard(newboard.dimensions,newboard.dimxdim)
            turn += 1
            turn
        elsif turn == ((newboard.dimensions * newboard.dimensions))
            puts 'Draw'
            turn
        end
    end
  end
end
