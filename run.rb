require 'io/console'

require_relative 'files/graphics'
require_relative 'files/handler'
require_relative 'files/game_object'
require_relative 'files/wall'
require_relative 'files/snake_section'
require_relative 'files/snake_head'
require_relative 'files/cherry'

$running = false
$score = 0
$latest_input = ''

$x = 64
$y = 40

def start
  $running = true
  $gamespeed = 0.175
  @handler = Handler.new
  @graphics = Graphics.new($x, $y)
  build_walls
  @handler.objects << SnakeHead.new($x / 2, $y / 2)
  @handler.objects << Cherry.new

  Thread.new do
    while $running
      $latest_input = $stdin.getch
    end
  end

  @handler.draw(@graphics)
  @graphics.render
  running while $running
  puts "\n\n\n\n\n\n\n\n\nGame Over!"
  puts "score: " + $score.to_s
end

def running
  framestart = Time.now
  until Time.now >= framestart + $gamespeed
  end
  @handler.tick
  @handler.draw(@graphics)
  @graphics.render
  # puts(Time.now - framestart)
end

def build_walls
  @graphics.canvas.each_index do |x|
    @graphics.canvas[x].each_index do |y|
      @handler.objects << Wall.new(x, y) if x == 0 || x == @graphics.x - 1 || y == 0 || y == @graphics.y - 1
    end
  end
end

def score_plus
  $score += 1
  $gamespeed *= 0.9875
end

def game_over
  $running = false
end


start
