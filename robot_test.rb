require "test/unit"
require_relative "robot"

X_CONST = 1
Y_CONST = 2
FACE_CONST = "NORTH"

class RobotTest < Test::Unit::TestCase
  def test_init
    robot = Robot.new(X_CONST, Y_CONST, FACE_CONST)
    assert_equal X_CONST, robot.x, "X should be #{X_CONST}"
    assert_equal Y_CONST, robot.y, "Y should be #{Y_CONST}"
    assert_equal FACE_CONST, robot.face, "FACE should be #{FACE_CONST}"
  end

  def test_change_place
    robot = Robot.new(X_CONST, Y_CONST, FACE_CONST)
    new_x = 2
    new_y = 3
    new_face = "SOUTH"

    robot.change_place(new_x, new_y, new_face)
    assert_equal new_x, robot.x, "X should be #{new_x}"
    assert_equal new_y, robot.y, "Y should be #{new_y}"
    assert_equal new_face, robot.face, "FACE should be #{new_face}"
  end

  def test_move_forward
    robot = Robot.new(X_CONST, Y_CONST, FACE_CONST)
    step = 4
    i = 0

    while i < step
      robot.move_forward
      i = i + 1
    end
    assert_equal step, (robot.x - X_CONST).abs + (robot.y - Y_CONST).abs, "Displacement should be #{step}"
  end

  def test_turn_left
    robot = Robot.new(X_CONST, Y_CONST, FACE_CONST)
    robot.turn_left

    face = FACE_HASH_CONST[FACE_CONST][:left]
    assert_equal face, robot.face, "Robot should face #{face} after turn left"
  end

  def test_turn_right
    robot = Robot.new(X_CONST, Y_CONST, FACE_CONST)
    robot.turn_right

    face = FACE_HASH_CONST[FACE_CONST][:right]
    assert_equal face, robot.face, "Robot should face #{face} after turn right"
  end
end
