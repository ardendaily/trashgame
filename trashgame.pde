/* SCREEN */
int WIDTH = 400;
int HEIGHT = 400;

/* GAME STATE */
Mode[][] MODES = null;
Mode gameState; 
int MODE = 0;
int SUBMODE = 0;

/* TRANSITIONS */
Transition[] TRANSITION = null;
Transition transState;
int T_INDEX = 0;
PImage FRAME_PREVIOUS;
PImage FRAME_NEXT;
boolean DO_TRANSITION = false;
int T_PASS = 0;

void setup() {
  /* Drawing area */
  surface.setResizable(true);
  surface.setSize(WIDTH, HEIGHT);
  surface.setResizable(false);
  noSmooth();
  frameRate(100);

  /* Game */
  buildModes();
}

void draw() {
  gameState = MODES[MODE][SUBMODE];
  transState = TRANSITION[T_INDEX];

  // Context Switching

  if (gameState.exitCode != 0) {

    int CODE = gameState.exitCode;

    if (MODE == 0) {
      if (CODE == 1) {
        //Menu into game
        FRAME_PREVIOUS = gameState.getBuffer();
        SUBMODE = 0;
        MODE = 1;
        DO_TRANSITION = true;
        gameState.reset();
      }
    } else if (MODE == 1) {
      if (CODE == 1) { 
        if (SUBMODE < MODES[MODE].length - 1 ) {
          //Next level
          FRAME_PREVIOUS = gameState.getBuffer();
          SUBMODE++;
          DO_TRANSITION = true;
        } else if (SUBMODE == MODES[MODE].length - 1) {
          //Game finish!
          println("finish!!");
          MODE = 0;
          SUBMODE = 2;
          FRAME_PREVIOUS = gameState.getBuffer();
          DO_TRANSITION = true;
        }
      }
    }
    gameState.exitCode = 0;
  }

  // Gamestate Debugging 
  milliMessage("");

  /* BUFFER HANDLING */
  if (DO_TRANSITION) {
    if (T_PASS == 0) { 
      //Populate transition with previous and current buffer

      gameState = MODES[MODE][SUBMODE]; //Pointer needs to catch up to changes. Ugly.
      gameState.render();
      FRAME_NEXT = gameState.getBuffer();
      transState.reset();
      transState.setFrames(FRAME_PREVIOUS, FRAME_NEXT);
      T_PASS++;
    } else { 
      //Animate difference between buffers
      gameState.render();
      transState.animateBuffer( gameState.getBuffer() );
      transState.render();
      image(transState.getBuffer(), 0, 0);
      T_PASS++;
    }

    if (transState.exitCode > 0) {
      DO_TRANSITION = false;
      T_PASS = 0;
      transState.reset();
    }
  } else {
    //Draw that game
    gameState.animate();
    gameState.render();
    image(gameState.getBuffer(), 0, 0);
  }

  // Gamestate Debugging 
  milliMessage("");
}

void keyPressed(KeyEvent e) {
  //if (!DO_TRANSITION) {
  println( e.getKeyCode() );
  gameState.keyEvent(e);
  //}
}