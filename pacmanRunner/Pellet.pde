class Pellet
{
  float xLoc;   //Creates a varable for x Location
  float yLoc;   //Creates a varable for y Location
  float r;      //Creates a varable for color red
  float g;      //Creates a varable for color green
  float b;      //Creates a varable for color blue
  float speed;   //Creates a varable for speed if pellets
  float diameter;   //Creates a varable for diameter of the pellets
  
  Pellet(float xlocation)   //The Contructor takes in the xLocation
  {
    xLoc = xlocation;       //This assigns the parameter to the variable in the class for the xLocation
    speed = random (1,4);   //Assigns a random speed between 1 and 4 to pellets
    r = random(50,255);   //Assigns a random red value to pellets
    g = random(50,255);   //Assigns a random green value to pellets
    b = random(50,255);   //Assigns a random blue value to pellets
    diameter = 18;      //Assigns a diameter value
    yLoc = 375;       //Assigns a y Location value
  }
  
  void display()
  {
    fill(r,g,b);  //Assigns the random rgb color as fill
    ellipse(xLoc, yLoc, diameter, diameter);  //Sets the pellets x, y locations and the size
  }
  

}
