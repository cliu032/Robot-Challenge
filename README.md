# Robot Challenge

## Description

- The application is a simulation of a toy robot moving on a square tabletop, of dimensions 5 units x 5 units.
- There are no other obstructions on the table surface.
- The robot is free to roam around the surface of the table, but is prevented from falling to destruction. 
- Any movement that would result in the robot falling from the table is ignored, however further valid movement commands is still accepted.
- The origin (0,0) is the SOUTH WEST most corner.
- The first valid command to the robot is a PLACE command, after that, any sequence of commands may be issued, in any order, including another PLACE command. 
- The application ignores all commands in the sequence until a valid PLACE command has been executed.

## Command

- PLACE X,Y,F
-- PLACE will put the toy robot on the table in position X,Y and facing NORTH, SOUTH, EAST or WEST.
- MOVE
-- MOVE will move the toy robot one unit forward in the direction it is currently facing.
- LEFT
-- LEFT will rotate the robot 90 degrees counter-clockwise without changing the position of the robot.
- RIGHT 
-- RIGHT will rotate the robot 90 degrees clockwise without changing the position of the robot.
- REPORT
-- REPORT will announce the X,Y and orientation of the robot.
  
## Table with map

- By switching to use table_with_map (as commented out in main.rb) enables visual feedback of the table and robot position, when a REPORT command is issued.

