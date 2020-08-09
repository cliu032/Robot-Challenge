require_relative "table"

table = Table.new(5, 5)

# require_relative "table_with_map"

# table = Table_with_map.new(5, 5)

loop {
  input = gets
  input ? input = input.chomp.split(" ") : break
  command = input[0]
  command ? command = command.upcase : next
  case command
  when "REPORT"
    table.report
  when "PLACE"
    begin
      raise "Error: [Format] PLACE X,Y,F" unless input.length() > 1
      raise "Error: [Format] PLACE X,Y,F" unless input[1].split(",").length() == 3
      input_x, input_y, input_face = input[1].split(",")
      x = input_x.to_i
      y = input_y.to_i
      raise "Error: [Format] X,Y must be positive integer" unless (input_x == "0" || x > 0) && (input_y == "0" || y > 0)
      raise "Error: [Data] Position X,Y outside of table." unless x < table.size_x && y < table.size_y
      face = input_face.upcase
      raise "Error: [Data] Face direction must be NORTH, SOUTH, EAST or WEST." unless FACE_HASH_CONST.include?(face)
      table.place(x, y, face)
    rescue StandardError => e
      puts e.message
    end
  when "MOVE"
    table.robot_move
  when "LEFT"
    table.robot_left
  when "RIGHT"
    table.robot_right
  else
    puts "Error: Command not found."
  end
}
