module TicTacToe
    class Board
        attr_accessor :dimensions

        def initialize(dimensions)
            @dimensions = dimensions
            @moves = Array.new((dimensions * dimensions), 0)
            @board = Array.new((dimensions * dimensions), ' ')
        end

        def printboard(dimensions)
            column = 0
            while column < dimensions
                print ' '
                ((dimensions * column)...((column + 1) * dimensions)).each { print '___' }
                print "\n", ' '
                ((dimensions * column)...((column + 1) * dimensions)).each { |i| print "|#{@board[i]}|" }
                print "\n"
                column += 1
            end
        end
    end
end