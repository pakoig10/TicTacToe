module TicTacToe
    class Player
        attr_reader :symbol

        def initialize(symbol)
            @symbol = symbol
        end

        def play1
            print '1st Player writes the position:'
            move = gets.chomp
            move = verification(move, board.board, 1)
            board.board[move.to_i] = player1
            board.moves[board.turn] = 1
            winner = decide(board.board, player1, board.dimensions)
            board.printBoard(board.dimensions, board.board)
        end

        def play2
            if game.winner != player1
                game.turn += 1
                print '2nd Player writes the position:'
                move = gets.chomp
                move = verification(move, board.board, 2)
                board.board[move.to_i] = player2
                board.moves[game.turn] = 1
                #winner = decide(board, player2, dimensions)
                printBoard(board.dimensions, board.board)
                game.turn += 1
            end
        end
    end
end