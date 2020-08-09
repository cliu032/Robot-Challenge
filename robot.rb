FACE_HASH_CONST = {
  "NORTH" => {
    :left => "WEST",
    :right => "EAST",
    :move => ->(x, y) { [x, y + 1] },
  },
  "WEST" => {
    :left => "SOUTH",
    :right => "NORTH",
    :move => ->(x, y) { [x - 1, y] },
  },
  "SOUTH" => {
    :left => "EAST",
    :right => "WEST",
    :move => ->(x, y) { [x, y - 1] },
  },
  "EAST" => {
    :left => "NORTH",
    :right => "SOUTH",
    :move => ->(x, y) { [x + 1, y] },
  },
}

class Robot
  attr_accessor :x, :y, :face

  def initialize(x, y, face)
    @x = x
    @y = y
    @face = face
  end

  def change_place(x, y, face)
    self.x = x
    self.y = y
    self.face = face
  end

  def move_forward(size_x = 0, size_y = 0)
    new_x, new_y = FACE_HASH_CONST[self.face][:move].call(self.x, self.y)
    self.x = size_x > 0 ? [[new_x, size_x - 1].min, 0].max : new_x
    self.y = size_y > 0 ? [[new_y, size_y - 1].min, 0].max : new_y
    return [self.x, self.y]
  end

  def turn_left
    self.face = FACE_HASH_CONST[self.face][:left]
  end

  def turn_right
    self.face = FACE_HASH_CONST[self.face][:right]
  end
end
