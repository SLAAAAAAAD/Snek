class SnakeSection <GameObject
  attr_accessor(:health)
  def initialize(x,y,health)
    @x = x
    @y = y
    @health = health
    @icon = "[]"
  end

  def tick(h)
    @health -= 1
    h.objects.delete(self) if health < 0
  end
end