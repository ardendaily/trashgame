//int debounceKeyCode( int _code, int _offset ){
 
//  int prev_key = _code;
//  int prev_millis = millis();
//  int offset = _offset;
//  if (keyPressed && keyCode == _code ) {
//     if (millis() > prev_millis + offset) {
//       return _code; 
//     }
//  }
//}

//int debounceKeyCode( int _code ) {
  
//  int prev_key = _code;
//  int prev_millis = millis();
//  int offset = _offset;
//  if (keyPressed && keyCode == _code ) {
//     if (millis() > prev_millis + offset) {
//       return _code; 
//     }
//  }
  
//}

int randomColor() {
 
  int dice1 = int(random(0,255));
  int dice2 = int(random(0,255));
  int dice3 = int(random(0,255));

  return color(dice1, dice2, dice3);
  
}

void milliMessage(String _message) {
   // Gamestate Debugging 
  println(millis() + "\t" + MODE + "\t" + SUBMODE + "\t" + gameState.exitCode + "\t" + transState.exitCode + " " + _message); 
}