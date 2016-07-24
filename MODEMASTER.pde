/* Master list of menus and levels */

void buildModes() {
  
  MODES = new Mode[2][3];


  /* Info Areas */
  MODES[0][0] = new menuTitle();
  MODES[0][1] = new menuGameOver();
  MODES[0][2] = new menuEndSequence();
  
  /* Levels */
  MODES[1][0] = new testGame();
  MODES[1][1] = new testGame();
  MODES[1][2] = new testGame();
  
  /* Transitions */
  TRANSITION = new Transition[1];
  TRANSITION[0] = new transitionScore();
}