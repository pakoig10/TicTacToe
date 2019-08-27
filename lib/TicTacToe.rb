require './TicTacToe/version'
require './TicTacToe/board'
require './TicTacToe/player'
require './TicTacToe/game'
require './TicTacToe/module_def'

game = TicTacToe::Game.new(0, 'none')
game.play_game

=begin
while Game.winner == 'none'
    player1.play1()
    player2.play2()
    if Game.winner == player1.symbol
    Game.winp1()
    elsif Game.winner == player2.symbol
    Game.winp2()
    elsif Game.turn == (dimensions * dimensions)
        Game.draw
    end

end
=end
