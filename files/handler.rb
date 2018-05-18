class Handler
  attr_accessor(:objects)

  def initialize
    @objects = []
    puts 'yea!'
  end

  def tick
    @objects.each {|obj| obj.tick self}
  end

  def draw(g)
    @objects.each {|obj| obj.draw g}
  end
end