require "test/unit"
require_relative "table"

SIZE_X_CONST = 5
SIZE_Y_CONST = 5
X_CONST = 1
Y_CONST = 2
FACE_CONST = "NORTH"

class TableTest < Test::Unit::TestCase
  attr_accessor :table

  def setup
    @table = Table.new(SIZE_X_CONST, SIZE_Y_CONST)
    self.table.place(X_CONST, Y_CONST, FACE_CONST)
  end

  def test_init
    assert_equal SIZE_X_CONST, self.table.size_x, "X should be #{SIZE_X_CONST}"
    assert_equal SIZE_Y_CONST, self.table.size_y, "Y should be #{SIZE_Y_CONST}"
  end

  def test_place_report
    out, err = capture_output do
      self.table.report
    end
    assert_match "#{X_CONST},#{Y_CONST},#{FACE_CONST}", out
  end

  def test_place_outside
    self.table.place(SIZE_X_CONST, SIZE_Y_CONST, FACE_CONST)

    out, err = capture_output do
      self.table.report
    end
    assert_match "#{X_CONST},#{Y_CONST},#{FACE_CONST}", out
  end

  def test_robot_move
    self.table.robot_move

    new_x = X_CONST
    new_y = Y_CONST
    case FACE_CONST
    when "NORTH"
      new_y = Y_CONST + 1 if Y_CONST + 1 < SIZE_Y_CONST
    when "SOUTH"
      new_y = Y_CONST - 1 if Y_CONST - 1 >= 0
    when "EAST"
      new_x = X_CONST + 1 if X_CONST + 1 < SIZE_X_CONST
    when "WEST"
      new_x = X_CONST - 1 if X_CONST - 1 >= 0
    end

    out, err = capture_output do
      self.table.report
    end
    assert_match "#{new_x},#{new_y},#{FACE_CONST}", out
  end

  def test_robot_left
    self.table.robot_left

    new_face = FACE_HASH_CONST[FACE_CONST][:left]

    out, err = capture_output do
      self.table.report
    end
    assert_match "#{X_CONST},#{Y_CONST},#{new_face}", out
  end

  def test_robot_right
    self.table.robot_right

    new_face = FACE_HASH_CONST[FACE_CONST][:right]

    out, err = capture_output do
      self.table.report
    end
    assert_match "#{X_CONST},#{Y_CONST},#{new_face}", out
  end

  def test_robot_move_boundary
    self.table.place(0, 0, "SOUTH")
    self.table.robot_move
    self.table.robot_right
    self.table.robot_move
    self.table.robot_right
    self.table.robot_move

    out, err = capture_output do
      self.table.report
    end
    assert_match "0,1,NORTH", out
  end
end
