/* 
 
 Great granddaddy to interesting things so we can store them 
 tidily as 2D array
 
 MODE[][]
 MODE[0][*] menus
 MODE[1][*] "levels", "games"
 
 */

public class Mode {

  int count, count_max;
  int exitCode = 0;
  PGraphics buffer; 

  void keyEvent(KeyEvent code) {
    //Passes in keycode
  }

  void animate() {
    //Crunch all numbers here
  }

  void render() {
    //Draws to buffer
  }

  PImage getBuffer() {
    //Returns buffer
    return buffer;
  }

  int getCount() {
    return count;
  }
  
  void reset() {}
}

public class Menu extends Mode {
}

public class Level extends Mode {
}

public class Transition extends Mode { 

  Transition() {
  }

  void setFrames(PImage fx, PImage fy) {
  }
  void reset() {
  }
  void animateBuffer(PImage buff) {}
}