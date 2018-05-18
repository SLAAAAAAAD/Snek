class GameObject
  attr_accessor(:x, :y, :icon)

  def initialize(x, y)
    @x = x
    @y = y
  end

  def tick(h)

  end

  def draw(g)
    g.canvas[x][y] = @icon
  end
end