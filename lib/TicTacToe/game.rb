# frozen_string_literal: true

module TicTacToe
  class Game
    attr_accessor :turn
    attr_accessor :winner
    attr_reader   :cross, :naught

    def initialize(turn, winner, cross, naught)
      @turn = turn.to_i
      @winner = winner
      dimensions = insert_dimensions
      @player1 = TicTacToe::Player.new(cross)
      @player2 = TicTacToe::Player.new(naught)
      dimxdim = Array.new((dimensions * dimensions), ' ')
      @newboard = TicTacToe::Board.new(dimensions, dimxdim)
      dimxdim = Array.new((dimensions * dimensions), 0)
      @moves = TicTacToe::Board.new(dimensions, dimxdim)
      Board.printboard(@newboard.dimensions,@newboard.dimxdim)
      # puts "Player 1 es #{@player1.symbol}"
    end

    def play_game()
        while @winner == 'none' && @turn < ((@newboard.dimensions * @newboard.dimensions))
            @player1.play1(@newboard, @moves, @player1, @turn, @winner)
            @turn = @player2.play2(@newboard, @moves, @player1, @turn, @winner, @player2)
            puts "#{@turn}"
        end
        # puts "Player 1 es #{@player1.symbol}"
    end
  end
end
