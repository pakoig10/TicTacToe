# frozen_string_literal: true

require './TicTacToe/version'
require './TicTacToe/board'
require './TicTacToe/player'
require './TicTacToe/game'
require './TicTacToe/module_def'

player1 = 'x'
player2 = 'o'
#try_again_var = 'no'
#while try_again_var == 'no'
game = TicTacToe::Game.new(0, 'none', player1, player2)
player1 = game.play_game
#if player1 == 'o'
#    player2 = 'x'
#else
#    player2 = 'o'
#end
#try_again_var = TicTacToe::Game.try_again(try_again_var)
puts "#{player1}"
#end

# while game.winner == 'none'
#     player1.play1()
#     player2.play2()
#     if game.winner == player1.symbol
#     game.winp1()
#     elsif Game.winner == player2.symbol
#     game.winp2()
#     elsif game.turn == (dimensions * dimensions)
#         game.draw
#     end
#
# end
