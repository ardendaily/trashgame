public class menuTitle extends Menu {

  PGraphics buffer;
  PFont titleText = loadFont("UbuntuCondensed-Regular-20.vlw");

  menuTitle() {
    reset();
  }

  void reset() {
    exitCode = 0; 
    buffer = createGraphics(WIDTH, HEIGHT);
  }

  void keyEvent(KeyEvent e) {
    exitCode = 1;
  }

  void animate() {
  }  

  void render() {
    buffer.beginDraw();
    buffer.background(#000000);
    buffer.textFont(titleText);
    buffer.textAlign(CENTER);
    buffer.text("trash microgame", WIDTH/2, HEIGHT/2);
    buffer.noStroke();
    buffer.endDraw();
  }

  PImage getBuffer() {
    return buffer;
  }
}