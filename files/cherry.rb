class Cherry < GameObject
  def initialize
    @icon = "{}"
    @x = Random.rand($x - 2) + 1
    @y = Random.rand($y - 2) + 1
  end

  def got!(h)
    score_plus
    @x = Random.rand($x - 2) + 1
    @y = Random.rand($y - 2) + 1
    check_space(h)
    h.objects.each do |obj|
      obj.health += 1 if obj.class == SnakeSection
    end
  end

  def check_space(h)
    h.objects.each do |obj|
      next if obj == self
      if @x == obj.x && @y == obj.y
        @x = Random.rand($x - 2) + 1
        @y = Random.rand($y - 2) + 1
        check_space(h)
      end
    end
  end
end