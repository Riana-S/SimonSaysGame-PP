//Riana Santos
//Personal Project - Simon Says Game
//9-16-22
//Modified from HS AP Computer Science Principles Unit Project

//creates quadrants as variables
PShape rect1;
PShape rect2;
PShape rect3;
PShape rect4;
PShape rect5;
PShape rect6;
PShape rect7;
PShape rect8;

//creates variables to be used in project
boolean playingSequence = false;
boolean startGame = true;
int [] sequence = {1};
int [] playerSequence = {};
int sequenceLength = 1;
int playerSequenceLength = 0;
int i;
int playerScore = 0;
int playerLives = 3;

void setup () {
//sets canvas size to a 600x600 square
  size (600, 600);
//creates quadrant shapes and puts them around the canvas perimeter
  rect1 = createShape (RECT, 0, 0, 200, 200);
  rect2 = createShape (RECT, 200, 0, 200, 200);
  rect3 = createShape (RECT, 400, 0, 200, 200);
  rect4 = createShape (RECT, 0, 200, 200, 200);
  rect5 = createShape (RECT, 0, 400, 200, 200);
  rect6 = createShape (RECT, 200, 400, 200, 200);
  rect7 = createShape (RECT, 400, 200, 200, 200);
  rect8 = createShape (RECT, 400, 400, 200, 200);
}

void draw () {
//displays title of game, creator, lives and score
  textSize(30);
  text("Simon Says", 220, 245);
  textSize(15);
  text("by Riana Santos", 240, 265);
  textSize(20);
  text("Press TAB to Play", 220, 285);
  textSize(15);
  //INSERT SOMETHING TO REFRESH THE SCORE SINCE IT WRITES OVER IT ATM
  text("LIVES: " + playerLives, 215, 335);
  text("SCORE: " + playerScore, 215, 375);
//sets quadrants to pastel colors
  shape(rect1);
  rect1.setFill(color(255, 170, 170));
  shape(rect2);
  rect2.setFill(color(250, 200, 100));
  shape(rect3);
  rect3.setFill(color(255, 255, 210));
  shape(rect4);
  rect4.setFill(color(250, 200, 250));
  shape(rect5);
  rect5.setFill(color(200, 100, 250));
  shape(rect6);
  rect6.setFill(color(100, 150, 250));
  shape(rect7);
  rect7.setFill(color(200, 250, 200));
  shape(rect8);
  rect8.setFill(color(200, 250, 250));
  
//whenever the mouse is over a quadrant, the quadrant will change to its bright color
  if (mouseX < 200 && mouseX > 0 && mouseY < 200 && mouseY > 0 && playingSequence == false) {
    rect1.setFill(color(250, 0, 0));
  }
  else if (mouseX < 400 && mouseX > 200 && mouseY < 200 && mouseY > 0 && playingSequence == false){
    rect2.setFill(color(250, 150, 0));
  }
  else if (mouseX < 600 && mouseX > 400 && mouseY < 200 && mouseY > 0 && playingSequence == false){
    rect3.setFill(color(250, 250, 0));
  }
  else if (mouseX < 200 && mouseX > 0 && mouseY < 400 && mouseY > 200 && playingSequence == false) {
    rect4.setFill(color(250, 0, 250));
  }
  else if (mouseX < 200 && mouseX > 0 && mouseY < 600 && mouseY > 400 && playingSequence == false) {
    rect5.setFill(color(150, 0, 150));
  }
  else if (mouseX < 400 && mouseX > 200 && mouseY < 600 && mouseY > 400 && playingSequence == false) {
    rect6.setFill(color(0, 0, 250));
  }
  else if (mouseX < 600 && mouseX > 400 && mouseY < 400 && mouseY > 200 && playingSequence == false) {
    rect7.setFill(color(0, 250, 0));
  }
  else if (mouseX < 600 && mouseX > 400 && mouseY < 600 && mouseY > 400 && playingSequence == false) {
    rect8.setFill(color(0, 250, 250));
  }
//plays the random sequence by changing the quadrant color from pastel to bright back to pastel
  else if (playingSequence == true){
    for (i=0; i<sequenceLength; i=i+1) {
      frameRate(0.025);
      if (sequence[i] == 1){
        rect1.setFill(color(250, 0, 0));
      }
      else if (sequence[i] == 2){
        rect2.setFill(color(250, 150, 0));
      }
      else if (sequence[i] == 3){
        rect3.setFill(color(250, 250, 0));
      }
      else if (sequence[i] == 4){
        rect4.setFill(color(250, 0, 250));
      }
      else if (sequence[i] == 5){
        rect5.setFill(color(150, 0, 150));
      }
      else if (sequence[i] == 6){
        rect6.setFill(color(0, 0, 250));
      }
      else if (sequence[i] == 7){
        rect7.setFill(color(0, 250, 0));
      }
      else if (sequence[i] == 8){
        rect8.setFill(color(0, 250, 250));
      }
    }
//begin code from https://forum.processing.org/one/topic/how-to-limit-random-to-integers.html
//randomly picks a quadrant and adds to sequence
    sequence = append(sequence, (int) random(1,8));
    println("SeqNum: " + sequence[1]);
//end code from https://forum.processing.org/one/topic/how-to-limit-random-to-integers.html
//increases sequence length by one after sequence gets longer
    sequenceLength = sequenceLength + 1;
//opens the game for player to input
    playingSequence = false;
    frameRate(10);
  }
  
 for (i=0; i<playerSequenceLength; i=i+1) {
//begin code inspired from https://forum.processing.org/one/topic/what-is-the-best-function-compare-two-arrays.html
//increases score by 10 points if player input matches the random sequence
   if (playerSequence[i] == sequence[i] && playingSequence == false) {
//end code inspired from https://forum.processing.org/one/topic/what-is-the-best-function-compare-two-arrays.html
     playerScore = playerScore + 10;
     println("SCORE: " + playerScore);
     playingSequence = true;
   }
//begin code inspired from https://forum.processing.org/one/topic/what-is-the-best-function-compare-two-arrays.html
//decreases lives by 1 if player input does not match the random sequence
   else if (playerSequence[i] != sequence [i] && playingSequence == false) {
//end code inspired from https://forum.processing.org/one/topic/what-is-the-best-function-compare-two-arrays.html
     playerLives = playerLives - 1;
     println("LIVES: " + playerLives);
     playingSequence = true;
   }
 }
}

void keyPressed () {
//starts the game when tab pressed
  if (key == TAB && startGame == true) {
    playingSequence = true;
    startGame = false;
  }
}
//begin code from https://www.youtube.com/watch?v=TN70A4T-uAE&t=473s
void mousePressed (){
//end code from https://www.youtube.com/watch?v=TN70A4T-uAE&t=473s
//takes in player input
    if (mousePressed && mouseX < 200 && mouseX > 0 && mouseY < 200 && mouseY > 0 && playingSequence == false){
      playerSequence = append(playerSequence, 1);
      playerSequenceLength = playerSequenceLength + 1;
      }
    else if (mousePressed && mouseX < 400 && mouseX > 200 && mouseY < 200 && mouseY > 0 && playingSequence == false){
      playerSequence = append(playerSequence, 2);
      playerSequenceLength = playerSequenceLength + 1;
      }
    else if (mousePressed && mouseX < 600 && mouseX > 400 && mouseY < 200 && mouseY > 0 && playingSequence == false){
      playerSequence = append(playerSequence, 3);
      playerSequenceLength = playerSequenceLength + 1;
      }
    else if (mousePressed && mouseX < 200 && mouseX > 0 && mouseY < 400 && mouseY > 200 && playingSequence == false){
      playerSequence = append(playerSequence, 4);
      playerSequenceLength = playerSequenceLength + 1;
      }
    else if (mousePressed && mouseX < 400 && mouseX > 200 && mouseY < 600 && mouseY > 400 && playingSequence == false){
      playerSequence = append(playerSequence, 5);
      playerSequenceLength = playerSequenceLength + 1;
      }
    else if (mousePressed && mouseX < 400 && mouseX > 200 && mouseY < 600 && mouseY > 400 && playingSequence == false){
      playerSequence = append(playerSequence, 6);
      playerSequenceLength = playerSequenceLength + 1;
      }
    else if (mousePressed && mouseX < 600 && mouseX > 400 && mouseY < 400 && mouseY > 200 && playingSequence == false){
      playerSequence = append(playerSequence, 7);
      playerSequenceLength = playerSequenceLength + 1;
      }
    else if (mousePressed && mouseX < 600 && mouseX > 400 && mouseY < 600 && mouseY > 400 && playingSequence == false){
      playerSequence = append(playerSequence, 8);
      playerSequenceLength = playerSequenceLength + 1;
      }
    }
