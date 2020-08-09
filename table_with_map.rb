require_relative "robot"
require_relative "table"

class Table_with_map < Table
  def initialize(size_x, size_y)
    super(size_x, size_y)
    @map = Array.new(size_y) { Array.new(size_x, ".") }
  end

  def place(x, y, face)
    super(x, y, face)
    @map[@robot.y][@robot.x] = "." if @robot
    @map[y][x] = face.upcase[0] if on_table?(x, y)
  end

  def robot_move
    if @robot
      @map[@robot.y][@robot.x] = "."
      super
      @map[@robot.y][@robot.x] = @robot.face[0]
    end
  end

  def robot_left
    @map[@robot.y][@robot.x] = @robot.turn_left[0] if @robot
  end

  def robot_right
    @map[@robot.y][@robot.x] = @robot.turn_right[0] if @robot
  end

  def report
    super
    @map.reverse.each {
      |line|
      for item in line
        print "#{item} "
      end
      print "\n"
    }
  end
end
