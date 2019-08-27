module TicTacToe
    class Game
        attr_accessor :turn
        attr_accessor :winner

        def initialize(turn, winner)
            @turn = turn
            @winner = winner
            dimensions = insert_dimensions
            player1 = TicTacToe::Player.new($cross)
            player2 = TicTacToe::Player.new($naught)
            board = TicTacToe::Board.new(dimensions)
            board.printboard(board.dimensions)
            puts "Player 1 es #{player1.symbol}"
        end

        def play_game()
            #player1.play1
            #player2.play2
            puts "Player 1 es #{player1.symbol}"
        end

    end
end