//Riana Santos
//Lab 4 Fading Color Grid
//Period 7
//10-1-19

//creates 4 rectangles for each quadrant
PShape rectangle1;
PShape rectangle2;
PShape rectangle3;
PShape rectangle4;
//creates a color value for each quadrant
int colorValue1 = 0;
int colorValue2 = 0;
int colorValue3 = 0;
int colorValue4 = 0;

void setup () {
//sets canvas size
  size (600,600);
//sets rectangle shape according to canvas width and height
  rectangle1 = createShape (RECT, 0, 0, width/2, height/2);
  rectangle2 = createShape (RECT, width/2, 0, width/2, height/2);
  rectangle3 = createShape (RECT, 0, height/2, width/2, height/2);
  rectangle4 = createShape (RECT, width/2, height/2, width/2, height/2);
}

void draw () {
//displays quadrants
  shape(rectangle1);
  shape(rectangle2);
  shape(rectangle3);
  shape(rectangle4);
  if (mouseX <= width/2 && mouseY <= height/2) {
//changes top left quadrant color to black when mouse is in top left
    colorValue1 = 0;
    rectangle1.setFill(color(colorValue1));
  }
  else {
//fades top left quadrant color to white when mouse is not in top left
    colorValue1 = colorValue1 + 3;
    rectangle1.setFill(color(colorValue1));
  }
  if (mouseX >= width/2 && mouseY <= height/2) {
//changes top right quadrant color to black when mouse is in top right
    colorValue2 = 0;
    rectangle2.setFill(color(colorValue2));
  }
  else {
//fades top right quadrant color to white when mouse is not in top right
    colorValue2 = colorValue2 + 3;
    rectangle2.setFill(color(colorValue2));
  }
  if (mouseX <= width/2 && mouseY >= height/2) {
//changes bottom left quadrant color to black when mouse is in bottom left
    colorValue3 = 0;
    rectangle3.setFill(color(colorValue3));
  }
  else {
//fades bottom left quadrant color to white when mouse is not in bottom left
    colorValue3 = colorValue3 + 3;
    rectangle3.setFill(color(colorValue3));
  }
  if (mouseX >= width/2 && mouseY >= height/2) {
//changes bottom right quadrant color to black when mouse is in bottom right
    colorValue4 = 0;
    rectangle4.setFill(color(colorValue4));
  }
  else {
//fades bottom right quadrant color to white when mouse is not in bottom right
    colorValue4 = colorValue4 + 3;
    rectangle4.setFill(color(colorValue4));
  }
  if (mousePressed) {
//quadrants fade to either red, blue, green, or yellow instead of white
    if (mouseX <= width/2 && mouseY <= height/2) {
//changes top left quadrant color to black when mouse is in top left
      colorValue1 = 0;
      rectangle1.setFill(color(colorValue1, colorValue1, colorValue1));
    }
    else {
//fades top left quadrant color to red when mouse is not in top left
      colorValue1 = colorValue1 + 3;
      rectangle1.setFill(color(colorValue1, 0, 0));
    }
    if (mouseX >= width/2 && mouseY <= height/2) {
//changes top right quadrant color to black when mouse is in top right
      colorValue2 = 0;
      rectangle2.setFill(color(colorValue2, colorValue2, colorValue2));
    }
    else {
//fades top right quadrant color to green when mouse is not in top right
      colorValue2 = colorValue2 + 3;
      rectangle2.setFill(color(0, colorValue2, 0));
    }
    if (mouseX <= width/2 && mouseY >= height/2) {
//changes bottom left quadrant color to black when mouse is in bottom left
      colorValue3 = 0;
      rectangle3.setFill(color(colorValue3, colorValue3, colorValue3));
    }
    else {
//fades bottom left quadrant color to blue when mouse is not in bottom left
      colorValue3 = colorValue3 + 3;
      rectangle3.setFill(color(0, 0, colorValue3));
    }
    if (mouseX >= width/2 && mouseY >= height/2) {
//changes bottom right quadrant color to black when mouse is in bottom right
      colorValue4 = 0;
      rectangle4.setFill(color(colorValue4, colorValue4, colorValue4));
    }
    else {
//fades bottom right quadrant color to yellow when mouse is not in bottom right
      colorValue4 = colorValue4 + 3;
      rectangle4.setFill(color(colorValue4, colorValue4, 0));
    }
  }
}
