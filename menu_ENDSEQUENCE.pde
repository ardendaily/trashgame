public class menuEndSequence extends Menu {

  PGraphics buffer;
  PFont titleText = loadFont("UbuntuCondensed-Regular-20.vlw");

  menuEndSequence() {
    reset();
  }

  void reset() {
    exitCode = 0; 
    buffer = createGraphics(WIDTH, HEIGHT);
  }

  void keyEvent(int code) {
    exitCode = 1;
  }

  void animate() {
  }  

  void render() {
    buffer.beginDraw();
    buffer.background(#000000);
    buffer.fill(#FFFFFF);
    buffer.textFont(titleText);
    buffer.textAlign(CENTER);
    buffer.text("you finished!\ncalculate score here", WIDTH/2, HEIGHT/2);
    buffer.endDraw();
  }

  PImage getBuffer() {
    return buffer;
  }
}