class Gosu::Image
  attr_reader :x, :y

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

  def clicked? mouse_x, mouse_y
    (@x < mouse_x) && (mouse_x < (@x + width)) && (@y < mouse_y) && (mouse_y < (@y + height))
  end
end
