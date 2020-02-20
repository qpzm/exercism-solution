# frozen_string_literal => true
class ResistorColorDuo
  class << self
    def value(colors)
      colors[0..1]
            .map { |c| color_to_num(c) }
            .reduce(:+)
            .to_i
    end

    private

    def color_to_num(color)
      COLOR_TO_NUM[color.to_sym]
    end

    COLOR_TO_NUM = {
      black: '0',
      brown: '1',
      red: '2',
      orange: '3',
      yellow: '4',
      green: '5',
      blue: '6',
      violet: '7',
      grey: '8',
      white: '9'
    }.freeze
  end
end
