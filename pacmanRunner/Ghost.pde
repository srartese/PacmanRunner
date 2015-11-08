class Ghost
{
  float xLoc;         // Variable for x Location of the ghost
  float yLoc;        // Variable for y Location of the ghost
  PImage theghost;   // Variable for chosen PImage of ghost 
  
  Ghost(float xlocation, PImage ghostImage)   //The Contructor takes in the xLocation and the ghost image
  {
    theghost = ghostImage;    //This assigns the parameter to the variable in the class for the image
    xLoc = xlocation;    //This assigns the parameter to the variable in the class for the xLocation
    yLoc = 370;     //Sets the y Location at a specfic point
  }

  
  void display()
  {
    //This puts the image selected (current) image at x and y location
  image(theghost, xLoc, yLoc);
  }
  

}
