# frozen_string_literal: true

module TicTacToe
  class Board
    attr_accessor :dimensions, :dimxdim

    def initialize(dimensions, dimxdim)
      @dimensions = dimensions
      @dimxdim = dimxdim
    end

    def self.printboard(dimensions, dxd)
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

    def win_horizontal(player)
      (1..@dimensions).each do |row|
        flag_horizontal = 0
        ((@dimensions * (row - 1))..((@dimensions * row) - 1)).each do |section|
          flag_horizontal += 1 if @dimxdim[section] == player
        end
        return true if flag_horizontal == @dimensions
      end
    end

    def win_vertical(player)
      (0..((@dimensions * 1) - 1)).each do |section|
        flag_vertical = 0
        dm_v = 0
        @dimensions.times do
          flag_vertical += 1 if @dimxdim[section + dm_v] == player
          dm_v += @dimensions
        end
        return true if flag_vertical == @dimensions
      end
    end

    def win_diagonal(player)
      (1..@dimensions).each do |row|
        ((@dimensions * (row - 1))..((@dimensions * row) - 1)).each do |section|
          flag_diagonal = 0
          dm_d = 0
          @dimensions.times do
            flag_diagonal += 1 if @dimxdim[section + dm_d] == player
            dm_d += @dimensions + 1
          end
          return true if flag_diagonal == @dimensions
        end
      end
    end

    def win_inverted_diagonal(player)
      flag_inverted_diagonal = 0
      (1..@dimensions).each do |row|
        flag_inverted_diagonal += 1 if @dimxdim[(@dimensions - 1) * row] == player
        return true if flag_inverted_diagonal == @dimensions
      end
    end
  end
end
