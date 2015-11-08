class Fruit
{
 PImage current;  // Variable for current PImage of fruit 
 float xLoc;     // Variable for y Location of the fruit
 float yLoc;     // Variable for y Location of the fruit
 
  Fruit(float xLocation, PImage fruitImage)  //The Contructor takes in the xLocation and the fruit image
  {
   current = fruitImage;  //This assigns the parameter to the variable in the class for the image
   xLoc = xLocation;    //This assigns the parameter to the variable in the class for the xLocation
   yLoc =  370;        //Sets the y Location at a specfic point
  }
  
  void display()
  {
    //This puts the image selected (current) image at x and y location
    image(current, xLoc, yLoc); 
  }
}
