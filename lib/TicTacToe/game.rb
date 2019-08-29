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
      @player_one = TicTacToe::Player.new(cross, 1)
      @player_two = TicTacToe::Player.new(naught, 2)
      dimxdim = Array.new((dimensions * dimensions), ' ')
      @board = TicTacToe::Board.new(dimensions, dimxdim)
      dimxdim = Array.new((dimensions * dimensions), 0)
      @moves = TicTacToe::Board.new(dimensions, dimxdim)
      Board.printboard(@board.dimensions, @board.dimxdim)
    end

    def play_game
      while @winner == 'none' && @turn < ((@board.dimensions * @board.dimensions))
        @turn = play(@player_one, @turn)
        @turn = play(@player_two, @turn) if @winner == 'none'
      end

      if @winner == @player_one.symbol || @winner == 'none'
        return @player_two.symbol
      elsif @winner == @player_two.symbol
        return @player_one.symbol
      end
    end

    def play(player, turn)
      print '1st Player writes the position:' if player.number == 1
      if turn != ((@board.dimensions * @board.dimensions))
        print '2nd Player writes the position:' if player.number == 2
        move = gets.chomp
        move = verification(move, @board.dimxdim, player.number)
        @board.dimxdim[move.to_i] = player.symbol
        @moves.dimxdim[turn.to_i] = 1
        @winner = win_combinations(player.symbol)
        Board.printboard(@board.dimensions, @board.dimxdim)
        verify_winner
        turn += 1
        return turn
      end
      if turn == ((@board.dimensions * @board.dimensions)) && @winner == 'none'
        puts 'Draw'
        return turn
      end
    end

    def win_combinations(player)
      if @board.win_horizontal(player) == true||
         @board.win_vertical(player) == true ||
         @board.win_diagonal(player) == true ||
         @board.win_inverted_diagonal(player) == true
         return player
      end
      @winner
    end

    def verify_winner
      puts "\n1st player won" if @winner == @player_one.symbol
      puts "\n2nd player won" if @winner == @player_two.symbol
      puts "\n"
    end

    def self.try_again(try_again_var)
      while try_again_var != 'yes' && try_again_var != 'no'
        print 'Would you want to try again (yes/no)? '
        try_again_var = gets.chomp.downcase
      end
      try_again_var
    end
  end
end
