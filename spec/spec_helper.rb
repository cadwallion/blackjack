require 'blackjack'

# THIS WONT END WELL
class Gosu::Font
  def initialize(*) ; end
end

class Gosu::Image
  def initialize(*) ; end
end

class Gosu::Window
  def initialize(*) ; end

  def caption=(caption)
    # YOINK
  end
end
