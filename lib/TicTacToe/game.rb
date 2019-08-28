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
        @player1 = TicTacToe::Player.new(cross, 1)
        @player2 = TicTacToe::Player.new(naught, 2)
        dimxdim = Array.new((dimensions * dimensions), ' ')
        @newboard = TicTacToe::Board.new(dimensions, dimxdim)
        dimxdim = Array.new((dimensions * dimensions), 0)
        @moves = TicTacToe::Board.new(dimensions, dimxdim)
        Board.printboard(@newboard.dimensions,@newboard.dimxdim)
        end

        def play_game
            while @winner == 'none' && @turn < ((@newboard.dimensions * @newboard.dimensions))
                @turn = play(@player1, @turn)
                @turn = play(@player2, @turn) if @winner =='none'
            end

            if @winner == @player1.symbol || @winner == 'none'
                return @player2.symbol
            elsif @winner == @player2.symbol
                return @player1.symbol
            end
        end


        def play(player, turn)
            print '1st Player writes the position:' if player.number == 1
            if turn != ((@newboard.dimensions * @newboard.dimensions))
                print '2nd Player writes the position:' if player.number == 2
                move = gets.chomp
                move = verification(move, @newboard.dimxdim, player.number)
                @newboard.dimxdim[move.to_i] = player.symbol
                @moves.dimxdim[turn.to_i] = 1
                @winner = win_combinations(player.symbol)
                Board.printboard(@newboard.dimensions, @newboard.dimxdim)
                verify_winner
                turn += 1
                return turn
            end
            if turn == ((@newboard.dimensions * @newboard.dimensions)) && @winner == 'none'
                puts 'Draw'
                return turn
            end

        end

        def win_combinations(player)
            if win_horizontal(player) == true || win_vertical(player) == true || win_diagonal(player) == true || win_inverted_diagonal(player) == true
                return player
            end
            @winner
        end

        def win_horizontal(player)
            for row in 1..@newboard.dimensions do
                flagH = 0
                for section in (@newboard.dimensions * (row - 1))..((@newboard.dimensions * row) - 1) do
                    flagH += 1 if @newboard.dimxdim[section] == player
                end
                return true if flagH == @newboard.dimensions
            end
        end

        def win_vertical(player)
            for section in 0..((@newboard.dimensions * 1) - 1) do
                flagV = 0
                dm_v = 0
                @newboard.dimensions.times do
                    flagV += 1 if @newboard.dimxdim[section + dm_v] == player
                    dm_v += @newboard.dimensions
                end
                return true if flagV == @newboard.dimensions
            end
        end

        def win_diagonal(player)
            for row in 1..@newboard.dimensions do
                for section in (@newboard.dimensions * (row - 1))..((@newboard.dimensions * row) - 1) do
                    flagD = 0
                    dm_d = 0
                    @newboard.dimensions.times do
                        flagD += 1 if @newboard.dimxdim[section + dm_d] == player
                        dm_d += @newboard.dimensions + 1
                    end
                    return true if flagD == @newboard.dimensions
                end
            end
        end

        def win_inverted_diagonal(player)
            flagID = 0
            for row in 1..@newboard.dimensions do
                flagID += 1 if @newboard.dimxdim[(@newboard.dimensions - 1) * row] == player
                return true if flagID == @newboard.dimensions
            end
        end

        def verify_winner
            if @winner == @player1.symbol
                puts "\n1st player won" 
                puts "\n"
            elsif @winner == @player2.symbol
                puts "\n2nd player won"
                #try_again = tryA(try_again)
                puts "\n"
            end
        end
=begin
        def self.try_again(try_again_var)
            while try_again_var != 'yes' && try_again_var != 'no'
                print 'Would you want to try again? '
                try_again_var = gets.chomp.downcase
            end
            try_again_var
        end
=end
    end
end
