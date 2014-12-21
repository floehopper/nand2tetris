// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel. When no key is pressed, the
// program clears the screen, i.e. writes "white" in every pixel.

(POLL)
   @colour
   M=0
   @KBD
   D=M
   @WHITE
   D;JEQ
   @colour
   M=M-1
(WHITE)
   @SCREEN
   D=A
   @address
   M=D
(LOOP)
   @address
   D=M
   @24576
   D=D-A
   @POLL
   D;JGE
   @colour
   D=M
   @address
   A=M
   M=D
   D=A+1
   @address
   M=D
   @LOOP
   0;JMP
