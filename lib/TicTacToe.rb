# frozen_string_literal: true

require './TicTacToe/version'
require './TicTacToe/board'
require './TicTacToe/player'
require './TicTacToe/game'
require './TicTacToe/module_def'

player1 = 'x'
player2 = 'o'
try_again_var = ' '
while try_again_var == ' ' || try_again_var == 'yes'
  try_again_var = ' '
  game = TicTacToe::Game.new(0, 'none', player1, player2)
  player1 = game.play_game
  player2 = if player1 == 'o'
              'x'
            else
              'o'
            end
  try_again_var = TicTacToe::Game.try_again(try_again_var) 
  puts 'Bye bye' if try_again_var == 'no'
end
