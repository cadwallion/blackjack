class Gosu::Image
  attr_reader :x, :y, :window
  
  def initialize_with_window *args
    @window = args[0]
    initialize_without_window *args
  end

  alias_method :initialize_without_window, :initialize
  alias_method :initialize, :initialize_with_window

  def draw_with_logging x, y, z, factor_x = 1, factor_y = 1, color = 0xffffffff, mode = :default
    @x = x
    @y = y
    @z = z
    @factor_x = factor_x
    @factor_y = factor_y
    draw_without_logging x, y, z, factor_x, factor_y, color, mode
  end

  alias_method :draw_without_logging, :draw
  alias_method :draw, :draw_with_logging

  def clicked?
    (@x < window.mouse_x) && (window.mouse_x < (@x + width)) && (@y < window.mouse_y) && (window.mouse_y < (@y + height))
  end
end
