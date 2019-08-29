# frozen_string_literal: true

# player_one player_two
module TicTacToe
  class Player
    attr_reader :symbol
    attr_reader :number

    def initialize(symbol, number)
      @symbol = symbol
      @number = number
    end
  end
end
