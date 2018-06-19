G21                     ; set units to mm
G90                     ; absolute positioning, meaning all coordinates are relative to (0,0,0). G91 is relative to the last point.
M104 S0                 ; hotend off
G28 X0 Y0               ; move X/Y to min endstops
G4 S4					; wait 4 seconds
G28 Z0                  ; move Z to min endstops
G4 S1					; wait 1 second
G1 Z15.0 F10500			; move the platform down 15mm
G4 S1 					; wait 1 second
G1 F5000     			; set travel speed (little slower than normal)
M203 X192 Y208 Z3       ; speed limits
M117 Hola Mundo!        ; send message to LCD


; Simple square
G1 F5000 X20 Y20 Z25
G1 X120
G1 Y120
G1 X20
G1 Y20
G4 S1  					; wait 1 second
G1 X120 Y120
G1 X20
G1 X120 Y20

; 3D triangle 
G1 X20 Y20 Z20
G1 X120 Y120 Z50
G1 X20 Y20
G1 Z20

M400  					; Wait for all moves to finish
G1 X0 Y250              ; move to cooling position
M84                     ; steppers off
M117 Listo.				; command to interface