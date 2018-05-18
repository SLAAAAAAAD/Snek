class Graphics
  attr_accessor(:x, :y, :canvas)

  def initialize(x, y)
    @x = x
    @y = y
    @canvas = Array.new(x)
    @canvas.map! do
      Array.new(y, "  ")
    end
  end

  def render
    mapstring = "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n"

    @canvas[0].each_index do |y|
      @canvas.each_index do |x|
        mapstring += @canvas[x][y]
      end
      mapstring += "\n"
    end
    puts mapstring
    clear
  end

  def clear
    @canvas.map! do
      Array.new(y, "  ")
    end
  end
end