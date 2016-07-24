public class testGame extends Level {

  PGraphics buffer;
  Player player;
  color bgColor;

  class Player {
    float x = WIDTH/2;
    float y = HEIGHT/2;
    int size = 5;
    color playerColor;

    Player() {
      playerColor = randomColor();
    }

    void control( int _x, int _y) {
      x += _x;
      y += _y;
    }

    void keyEvent( KeyEvent _code ) {
      switch(_code.getKeyCode()) {
      case 37:
        control( -10, 0);
        break;
      case 38:
        control( 0, -10);
        break;
      case 39:
        control( 10, 0);
        break;
      case 40:
        control( 0, 10);
        break;
      }
    }

    void render(PGraphics buffer) {
      buffer.fill(playerColor);
      buffer.rect(x, y, size, size);
    }

    boolean isOffscreen() {
      if (x < 0 || x > WIDTH || y < 0 || y > HEIGHT) {
        return true;
      } else {
        return false;
      }
    }
  }

  testGame() {
    buffer = createGraphics(WIDTH, HEIGHT);
    player = new Player();
    bgColor = randomColor();
  }

  void keyEvent(KeyEvent code) {
    player.keyEvent(code);
  }

  void animate() {
    if (player.isOffscreen()) {
     exitCode = 1; 
    }
  }

  void render() {
    buffer.beginDraw();
    buffer.noStroke();
    buffer.background(bgColor);
    player.render(buffer);
    buffer.endDraw();
  }

  PImage getBuffer() {
    return buffer;
  }
}