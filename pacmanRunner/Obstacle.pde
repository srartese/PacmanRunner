class Obstacle
{
  float xLoc;      // Variable for x Location of the obstacle
  float side;      // Variable for width of the obstacle
  float yLoc;      // Variable for y Location of the obstacle
  float obsHeight; // Variable for height of the obstacle

  Obstacle (float xlocation)    //The Contructor takes in the xLocation
  {
  xLoc = xlocation;  //This assigns the parameter to the variable in the class for the xLocation
  side = 70;            //Assigns the width a value
  obsHeight = 80;      //Assigns the height a value
  yLoc = 325;        //Assigns the y Location at a specfic point
  }
  
  
  void display()
  {
    fill( 33,33,222);
    rect(xLoc, yLoc, side, obsHeight);  //Creates the obstacles and takes in all the values needed
  }
}
