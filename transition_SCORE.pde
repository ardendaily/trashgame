public class transitionScore extends Transition {

  float box_x;
  float box_y;
  int COUNT = 0;
  int COUNT_MAX = 1000;
  PImage firstFrame;
  PImage lastFrame;
  PGraphics buffer;

  transitionScore() {
    reset();
  }

  void keyEvent(KeyEvent code) {
  }

  void animate() {
    COUNT += 100;
    box_y = map(COUNT, 0, COUNT_MAX, 0, -WIDTH);

    if (COUNT > COUNT_MAX) {
      COUNT = 0;
      exitCode = 1;
    }
  }
  
  void animateBuffer(PImage _last) {
     lastFrame = _last;
     animate();
  }

  void render() {
    if (lastFrame != null) {
      buffer.beginDraw();
      buffer.image(lastFrame, 0, 0);
      buffer.image(firstFrame, 0, box_y);
      buffer.endDraw();
    }
  }

  void reset() {
    exitCode = 0;
    COUNT = 0;
    COUNT_MAX = 1000;
    box_x = 0;
    box_y = 0;
    buffer = createGraphics(WIDTH, HEIGHT);
  }

  int getCount() {
    return COUNT;
  }

  public void setFrames(PImage first, PImage last) {
    firstFrame = first;
    lastFrame = last;
  }

  PImage getBuffer() {
    return buffer;
  }
}