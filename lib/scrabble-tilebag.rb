
module Scrabble
  class TileBag
    attr_reader :tiles

    def initialize
      @tiles = {
        "A" =>9,
        "B" =>2,
        "C" =>2,
        "D" =>4,
        "E" =>12,
        "F" =>2,
        "G" =>3,
        "H" =>2,
        "I" =>9,
        "J" =>1,
        "K" =>1,
        "L" =>4,
        "M" =>2,
        "N" =>6,
        "O" =>8,
        "P" =>2,
        "Q" =>1,
        "R" =>6,
        "S" =>4,
        "T" =>6,
        "U" =>4,
        "V" =>2,
        "W" =>2,
        "X" =>1,
        "Y" =>2,
        "Z" =>1}
    end

    def draw_tiles(num)
        hand = []
        if tiles_remaining < num
          num = tiles_remaining
        end
        until hand.length == num
          letter = @tiles.keys.sample
          if letter_remaining?(letter)
            hand << letter
            @tiles[letter] -= 1
          end
        end
        return hand
    end

    def letter_remaining?(letter)
        if @tiles[letter] > 0
          return true
        end
    end

    def tiles_remaining
      return @tiles.values.inject(:+)
    end

  end
end
