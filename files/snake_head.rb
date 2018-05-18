class SnakeHead < GameObject
  attr_accessor(:direction)

  def initialize(x, y)
    @x = x
    @y = y
    @icon = "[]"
    @direction = Random.rand(4)
  end

  def tick(h)
    x = @x
    y = @y
    case $latest_input
      when 'w'
        @direction = 0 unless @direction == 2
      when 'a'
        @direction = 3 unless @direction == 1
      when 's'
        @direction = 2 unless @direction == 0
      when 'd'
        @direction = 1 unless @direction == 3
      when 'i'
        @direction = 0 unless @direction == 2
      when 'j'
        @direction = 3 unless @direction == 1
      when 'k'
        @direction = 2 unless @direction == 0
      when 'l'
        @direction = 1 unless @direction == 3
    end

    case @direction
      when 0
        @y -= 1
      when 1
        @x += 1
      when 2
        @y += 1
      when 3
        @x -= 1
    end

    h.objects << SnakeSection.new(x, y, $score)

    obj = collision(h)
    unless obj.nil?
      if obj.class == Cherry
        obj.got!(h)
      else
        game_over
      end
    end
  end

  def collision(h)
    h.objects.each do |obj|
      next if obj == self
      return obj if obj.x == @x && obj.y == @y
    end
    nil
  end
end