public class menuGameOver extends Menu {

  PGraphics buffer;
  PFont titleText = loadFont("UbuntuCondensed-Regular-20.vlw");

  menuGameOver() {
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
    buffer.text("game over", WIDTH/2, HEIGHT/2);
    buffer.endDraw();
  }

  PImage getBuffer() {
    return buffer;
  }
}