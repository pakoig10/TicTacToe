# frozen_string_literal: true

def verification(moves, board, player)
  v = false
  while v == false
    if board[moves.to_i] == ' '
      return moves
    elsif player == 1
      print '1st Player writes the position:'
      moves = gets.chomp
    elsif player == 2
      print '2nd Player writes the position:'
      moves = gets.chomp
    end
  end
end

def insert_dimensions
  dimensions = 0
  while dimensions < 3
    print 'Insert the dimensions for Tic Tac Toe(N x N): '
    dimensions = gets.chomp.to_i
    puts "\n"
    dimensions = 0 if dimensions < 3
  end
  dimensions
end
