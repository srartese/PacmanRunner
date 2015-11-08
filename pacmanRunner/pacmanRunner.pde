/* Pacman Runner - by Sara Artese
This program is a Pacman based game where objects come in randomly from the right 
of the screen and based on what they are Pacman needs to jump and avoid it or collect
it.  
The keys used to play are Spacebar to jump, down arrow to accelerate the fall from
the jump, 'p' to pause, and 'c' to continue.
 */


Pacman p1;    // This makes a reference for the Pacman object 
Spawner sp1;   // This makes a reference for the Spawner object 

PImage[] fruitImages;   // Makes a reference for an array of the fruitImages I imported
PImage[] ghostImages;   // Makes a reference for an array of the ghostImages I imported

void setup()
{
  size(1200, 600);  // Sets the window size
  frameRate(30);    // Sets the framRate to 30
  smooth();         // Smooths the objects
  colorMode(RGB);    //Sets colorMode to RGB
  noStroke();        // Turns off Stroke on objects
  p1 = new Pacman();   //Creates a Pacman object
  sp1 = new Spawner();   //Creates a Spawner object
  imageMode(CENTER);      // Sets the drawing point to the center
  fruitImages = new PImage[7];    // Creates the spaces in the array for the images of fruit
  fruitImages[0] = loadImage("cherries.jpg");        //Imports the cherry image 
  fruitImages[1] = loadImage("strawberries.jpg");    //Imports the strawberry image
  fruitImages[2] = loadImage("apples.jpg");          //Imports the apple image
  fruitImages[3] = loadImage("grapes.jpg");         //Imports the grape image
  fruitImages[4] = loadImage("bananas.jpg");        //Imports the banana image
  fruitImages[5] = loadImage("razzle.jpg");        //Imports the razzle image
  fruitImages[6] = loadImage("pretzel.jpg");       //Imports the pretzel image
  
  ghostImages = new PImage[5];        // Creates the spaces in the array for the images of ghosts
  ghostImages[0] = loadImage("pinky.jpg");      //Imports the pink ghost image
  ghostImages[1] = loadImage("clyde.jpg");      //Imports the orange ghost image
  ghostImages[2] = loadImage("inky.jpg");      //Imports the blue ghost image
  ghostImages[3] = loadImage("blinky.jpg");    //Imports the red ghost image
  ghostImages[4] = loadImage("buster.jpg");     //Imports the green ghost image
}


void keyPressed()
{
  if (key == ' ')
    p1.jump();   //Spacebar makes pacman jump
  else if (keyCode == DOWN)
    p1.down();    //Down arrow key makes pacman accelerate faster going down or as soon as it is pressed
  else if (key == 'p')
 { 
   //p causes the game to pause 
    sp1.pause(); //Spawner pauses
    p1.pause();  //Pacman's movement pauses
 }
  else if (key == 'c') //continue 
  {
    //c causes the game to continue
    sp1.unPause();  //Pawner continues 
    p1.unPause();   //Pacman continues
  } 
}

void draw()
{
  background(0); 

  sp1.spawn(); //Calls the spawn method in the spawnerclass

  sp1.update();  //Calls the update method in the spawner class

  p1.move();     // Calls the move method in the pacman class
  p1.display();  //  Draws the display method in the pacman class
  sp1.display();  //  Draws the display in the spawner class
  
  //Draws the ground that the game is played on 
  fill(33,33,222);
  rect(0, 405, width, height);
}



//obstacles broke, timer, restart, speed up with time

