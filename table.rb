require_relative "robot"

class Table
  attr_accessor :size_x, :size_y

  def initialize(size_x, size_y)
    @size_x = size_x
    @size_y = size_y
  end

  def place(x, y, face)
    return if not on_table?(x, y)
    if @robot
      @robot.change_place(x, y, face)
    else
      @robot = Robot.new(x, y, face)
    end
  end

  def robot_move
    @robot.move_forward(self.size_x, self.size_y) if @robot
  end

  def robot_left
    @robot.turn_left if @robot
  end

  def robot_right
    @robot.turn_right if @robot
  end

  def report
    puts "#{@robot.x},#{@robot.y},#{@robot.face}" if @robot
  end

  private

  def on_table?(x, y)
    x >= 0 && y >= 0 && x < self.size_x && y < self.size_y
  end
end
