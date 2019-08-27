# frozen_string_literal: true

require './TicTacToe/version'
require './TicTacToe/board'
require './TicTacToe/player'
require './TicTacToe/game'
require './TicTacToe/module_def'

cross = 'x'
naught = 'o'
game = TicTacToe::Game.new(0, 'none', cross, naught)
game.play_game

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
