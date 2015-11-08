class Pacman
{
  float xLoc;  //Creates an x Location varable 
  float yLoc;    //Creates an y Location varable 
  float gravity;  //Creates a varable for gravity
  float radius;   //Creates a varable for the radius of Pacman
  float diameter;  //Creates a varable for the diameter of Pacman
  boolean jumped;   //Creates a boolean varable for jumping
  float ySpeed;     //Creates a varable for the acceleration of Pacman
  boolean pause = false;   //Creates a boolean varable for pausing and set it to false
  int nImages = 4;    //Creates a varable for the animation images for Pacman and set it to the four
  PImage [ ] anim = new PImage [nImages];   //Creates a varable for an array of images and gives it space of nImages
  int curFrame = 0;   //Creates a varable for the current image and set it to 0

  Pacman()
  {
    xLoc = 550;     //Assigns the x Location a value
    yLoc = 370;     //Assigns the y Location a value
    gravity = .1;    //Assigns the gravity a value
    diameter = 60;    //Assigns the diameter a value
    radius = diameter/2;   //Assigns the radius to be half of the diameter a value
    jumped = false;   //Assigns the boolean jumpped a value of false
    ySpeed = 5;       //Assigns the ySpeed a value
  
    loadImages();    //This sets it so the Images can load
  }


 void loadImages()
  {
    
    //This loads all of the images need for the animation in an array
    for (int i = 0; i < nImages; i++)
    {
      anim[i] = loadImage ("pacman/pacman" + i + ".png");
    }
  }
  
   void transition()  //This makes the transition for the animation
  {
   if(pause == false)  //If the game is not paused it will animate
  { 
    //This checks and cycles through the images repeatedly 
    if( curFrame < 3)
    curFrame++;
    else
    curFrame = 0;
  }
  }
  
  void body()
  {
    //The body of Pacman is the animation 
    transition();  
   image(anim[curFrame], xLoc, yLoc); // Pacman is made as an image at the two locations
  }

  void jump()  
  {
    //This is the jump method and if pause is false then Pacman can jump
    if (pause == false)
       jumped = true;
  }

  void move()
  {
    // This is the normal movement for pacman when jumping when pause is false
    if (pause == false)
   {
     //This is the gravity and up movement and velocity 
      if (jumped)
      {
        ySpeed = ySpeed - gravity;   
        yLoc = yLoc - ySpeed;  
        
      //This is the down movement when not being accelerated 
        if (yLoc < 370)
        {
          ySpeed = ySpeed - gravity;  
          yLoc = yLoc - ySpeed;
        }
      //This is reseting the movements
        if ( yLoc > 370)
        {
          yLoc = 370; 
          jumped = false;
          ySpeed = 6;
        }
      }
    }
  }

 void down()
  {
    //This is to accelerate the gravity in jumping and if pause is false, he can accelerate down
    if (pause == false)
    {
    if (yLoc < 370)
    {
      ySpeed = ySpeed - gravity * 50; 
      yLoc = yLoc - ySpeed;
    }
     // This resets the gravity
    if ( yLoc > 370)
    {
      yLoc = 370; 
      jumped = false;
      ySpeed = 6;
    }
    }
  }

  void pause()
  {
    //This is to control the pause boolean
    pause = true;
  }

  void unPause()
  {
    //This is to control the pause boolean
    pause = false;
  }

  void display()
  {
    body(); //This displays the animation of pacman 
  }
}

