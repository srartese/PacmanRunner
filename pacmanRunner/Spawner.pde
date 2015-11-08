class Spawner    //The most important of all the classes
{
  //Varaibles
  ArrayList<Fruit> fruits;  // The referenece to Arraylist for fruits  
  ArrayList<Ghost> ghosts;   // The referenece to Arraylist for ghosts 
  ArrayList<Pellet> pellets;  // The referenece to Arraylist for pellets
  ArrayList<Obstacle> obstacles;   // The referenece to Arraylist for obstacles 
  float timer;      //The time that will control the arraylist spawing
  boolean pause = false;     //Creates the pause variable and sets to false
  String pau = "PAUSE";  //String variable for when paused
  PFont times;     //Sets a font
  int score;     //Variable for the score
  float speed = 8;   //Sets the speed for all the objects
  boolean dead = false;    // Variable for dying



  Spawner()
  {
    fruits = new ArrayList<Fruit>();   //Creates the arraylist for fruit
    ghosts = new ArrayList<Ghost>();    //Creates the arraylist for ghost
    pellets = new ArrayList<Pellet>();   //Creates the arraylist for pellet
    obstacles = new ArrayList<Obstacle>();   //Creates the arraylist for obstacle
    timer = 0;    //Sets the time to 0 at first
    score = 0;    //Sets the score to 0 at first
    times = createFont("Times", 12, true);   //Creates the times font 
  }

  void spawn()
  {

    if (timer <= 0)  //Checks the time for the timer
    {
      timer = random(1.4, 1.7);  //This sets the timer each time something spawns
      int selector = (int)random(0, 11);   //This is selecting by how many cases there are
      switch(selector)
      {
      case 0: 
      case 1:
      case 2:
      case 3:
      case 4:
        pellets.add(new Pellet(width + 100));   
      //For all previous cases there is more of a chance for a pellet spawn
        break;
      case 5:
      case 6:
      case 7:
        ghosts.add(new Ghost(width + 100, ghostImages[(int)random(0, 5)])); 
      //Case 5,6,7 are chances for ghost to spawn
        break;
      case 8:
        fruits.add(new Fruit(width + 100, fruitImages[(int)random(0, 7)]));
      //Case 8 isthe chance for a fruit to spawn
        break;
      case 9:
      default:
        obstacles.add(new Obstacle(width + 100));  // case 9, 10, 11 are chances for obstacles
        break;
      }
    }
    timer = timer - (1 / frameRate);  //This is to resets the timer when it hits 0
  }

  void update()
  {
   //This constantly checks the location of the objects and collisions 
   
    if (pause == false && dead == false)  //If the game is not paused and player not dead
    {
      for (int i = 0; i < pellets.size (); i++)
      {
        //Movement for the pellets
        pellets.get(i).xLoc = pellets.get(i).xLoc - speed;  
        
      // Basic collision detection
        if ( p1.xLoc < pellets.get(i).xLoc + pellets.get(i).diameter)
        {
          if (p1.xLoc + p1.radius > pellets.get(i).xLoc -  pellets.get(i).diameter )
          {
            if ( p1.yLoc < pellets.get(i).yLoc + pellets.get(i).diameter)
            {
              if (p1.yLoc + p1.radius > pellets.get(i).yLoc - pellets.get(i).diameter)
              {
                pellets.remove(pellets.get(i));  //If collision detected, remove
                score = score + 10;              //and add 10 points to score
              }
            }
          }
        } else if (pellets.get(i).xLoc < -100)
        {
          //If the pellets are off the window they are removed from the arraylist
          pellets.remove(pellets.get(i));
        }
      }

      for (int i = 0; i < ghosts.size (); i++)
      {
        //Movement for the ghosts
        ghosts.get(i).xLoc = ghosts.get(i).xLoc - speed;

        // Basic collision detection
        if ( p1.xLoc < ghosts.get(i).xLoc + 60)
        {
          if (p1.xLoc + p1.radius > ghosts.get(i).xLoc - 35)
          {
            if ( p1.yLoc < ghosts.get(i).yLoc + 35)
            {
              if (p1.yLoc + p1.radius > ghosts.get(i).yLoc - 35)
              {
                ghosts.remove(ghosts.get(i)); //If collision detected, remove
                score = score - 50;           // remove 50 points from score
                p1.xLoc = p1.xLoc - 30;      // push xLocation back 30
              }
            }
          }
        } else if (ghosts.get(i).xLoc < - 100)
        {
          //If the ghosts are off the window they are removed from the arraylist
          ghosts.remove(ghosts.get(i));
        }
      }

      for (int i = 0; i < obstacles.size (); i++)
      {
        //Movement for the obstacles
        obstacles.get(i).xLoc = obstacles.get(i).xLoc - speed;
        
        // Basic collision detection
        if ( p1.xLoc < obstacles.get(i).xLoc + obstacles.get(i).side)
        {
          if (p1.xLoc + p1.radius > obstacles.get(i).xLoc)
          {
            if ( p1.yLoc < obstacles.get(i).yLoc + obstacles.get(i).obsHeight)
            {
              if (p1.yLoc + p1.radius > obstacles.get(i).yLoc)
              {
                score = score - 50;       // remove 10 points form score
                p1.xLoc = p1.xLoc - 15;     // push x location 15 back 
                obstacles.remove(obstacles.get(i));    //If collision detected, remove
              }
            }
          }
        } else if (obstacles.get(i).xLoc < - 100)
        {
          //If the obstacles are off the window they are removed from the arraylist
          obstacles.remove(obstacles.get(i));
        }
      }

      for (int i = 0; i < fruits.size (); i++)
      {
        //Movement for the fruits
        fruits.get(i).xLoc = fruits.get(i).xLoc - speed;
        
        // Basic collision detection
        if ( p1.xLoc < fruits.get(i).xLoc + 50)
        {
          if (p1.xLoc + p1.radius > fruits.get(i).xLoc - 25 )
          {
            if ( p1.yLoc < fruits.get(i).yLoc + 50)
            {
              if (p1.yLoc + p1.radius > fruits.get(i).yLoc - 50)
              {
                fruits.remove(fruits.get(i));   //If collision detected, remove
                score = score + 75;             //and add 75 points to score
              }
            }
          }
        } else if (fruits.get(i).xLoc < -100)
        {
          //If the fruits are off the window they are removed from the arraylist
          fruits.remove(fruits.get(i));
        }
      }
    }
    
    if(p1.xLoc < 0 + p1.radius)  
    {
      //If pacman reaches the left wall than the player has died
      dead = true;
    }
  }

  void pause()
  {
    if (dead == false)
    {
      //If dead is false than it can be paused
    pause = true;
    }
  }

  void unPause()
  {
    if (dead == false)
    {
      //If dead is false than it can be unpaused
    pause = false;
    }
  }
  
  void died()
  {
    //This is when player dies
    fill(255,0,0, 50);
    rect(0,0, width, height); //A red ting goes over the sky 
    String die = "The ghosts got ya!"; //This text appears on the window
    textFont(times, 80);
    fill(180);
    text(die, 330, 120); //displays text
  }

  void display()
  {    
    for (int i = 0; i < pellets.size (); i++)
    {
      //For each pellet spawn displays it
      pellets.get(i).display();
    }

    for (int i = 0; i < ghosts.size (); i++)
    {
      //For each ghost spawn displays it
      ghosts.get(i).display();
    }

    for (int i = 0; i < obstacles.size (); i++)
    {
      //For each obstacle spawn displays it
      obstacles.get(i).display();
    }

    for (int i = 0; i < fruits.size (); i++)
    {
      //For each fruit spawn displays it
      fruits.get(i).display();
    }
    
  if (pause == true)
  {
    //If pause is on, it diplats the pause text on the screen
    textFont(times, 120);
    fill(180);
    text(pau, 400, 200);
  }
  
  //If dead is true, died gets called
  if (dead)
     died();
  
  //This displays the score on the window   
   String scorer = "Score: " + score;
    textFont(times, 30);
    fill(255, 238, 0);
    text(scorer, 10, 40);
  }
}

