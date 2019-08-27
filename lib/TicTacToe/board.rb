# frozen_string_literal: true

module TicTacToe
  class Board
    attr_accessor :dimensions, :dimxdim

    def initialize(dimensions,dimxdim)
      @dimensions = dimensions
      @dimxdim = dimxdim
      # @moves = Array.new((dimensions * dimensions), 0)
      # @board = Array.new((dimensions * dimensions), ' ')
    end

    def self.printboard(dimensions,dxd)
      column = 0
      while column < dimensions
        print ' '
        ((dimensions * column)...((column + 1) * dimensions)).each { print '___' }
        print "\n", ' '
        ((dimensions * column)...((column + 1) * dimensions)).each { |i| print "|#{dxd[i]}|" }
        print "\n"
        column += 1
      end
    end

    def self.insert_dimensions
      dimensions = 0
      while dimensions < 3
        print 'Insert the dimensions for Tic Tac Toe(N x N): '
        dimensions = gets.chomp.to_i
        puts "\n"
        dimensions = 0 if dimensions < 3
      end
      dimensions
    end

=begin

    def self.win_com(newboard.dimxdim, player1, newboard.dimensions)
        horizontal_com()
    end

=end

  end
end
