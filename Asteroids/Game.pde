public class Game
{
  public static final int MIN_ASTEROID_SIZE = 10;
  public static final int MAX_ASTEROID_SIZE = 50;
  public static final int LEFT = -1;
  public static final int RIGHT = 1;
  public static final int FIRE = 0;
  public static final int MIN_ASTEROIDS = 5;
  public static final int STEP = 10;                

  public static final int MISS = -100;
  public static final int FLYING_SAUCER_SCORE = 1000;

  public static final int INITIAL_LIVES = 3; 

  private ArrayList<Asteroid> asteroids = new ArrayList<Asteroid>();
  private FlyingSaucer flyingSaucer;
  private SpaceShip spaceShip;
  private ScreenData screenData;

  public Game()
  { 
    // create spaceship
    spaceShip = new SpaceShip();

    for(int i=0; i<MIN_ASTEROIDS; i++)
    {
      asteroids.add(new Asteroid());
    }
    
    // create screenData here
    screenData = new ScreenData();
  }

  public void action(int value)
  {
    try
    {
      switch(value)
      {
      case Game.LEFT:  
        spaceShip.incX(-Game.STEP);
        break;
      case Game.RIGHT:  
        spaceShip.incX(Game.STEP);
        break;
      case Game.FIRE:   
        if (spaceShip.getBullet()==null)
        {
          spaceShip.fire();
        }
        break;
      }
    }
    catch(OutOfScreenException e)
    {
        println(e.getMessage());
    }
  }

  public void update()
  {
    // display screen data
    screenData.display();

    // try to create a flying saucer (if it doesn't exist)
    if (flyingSaucer==null)
    {
      int chance = (int)random(1, 100); // framerate/100 (i.e. 1/10) chance per second that saucer is created
      if (chance==1)
      {
        flyingSaucer=new FlyingSaucer();
      }
    }

    for(Asteroid a: asteroids)
    {
       a.display(); 
    }
    // display flying saucer (if it exists)
    if (flyingSaucer!=null)
    {
        flyingSaucer.display();
        
        if (spaceShip.getBullet()!=null)
        {
          spaceShip.getBullet().display();
          
          if(flyingSaucer.hitBy(spaceShip.getBullet()))
          {
              screenData.incScore(1000);
              flyingSaucer = null;
              explode.play();
              spaceShip.reloadBullet();
              background(0,255,0);
              redraw();
              return;
          }
        }
      
        if(flyingSaucer.visible() == false)
        {
            flyingSaucer = null;
        }
    }

    // display spaceship
    spaceShip.display();

    // if the bullet is fired - display it and check for collisions
    if (spaceShip.getBullet()!=null)
    {
      // display the bullet
      spaceShip.getBullet().display();
      fire.play();

      Asteroid a=null; // Temp Variable to check if astoids was hit
      
      for(int i=0;i<asteroids.size();i++)
      {
        if (asteroids.get(i).hitBy(spaceShip.getBullet()))
        {
          a = asteroids.get(i);
        }
        // if collision detected remove asteroid
        if (a!=null)
        { 
          screenData.incScore(asteroids.get(i).getScoreValue());
          asteroids.remove(i);                 // remove asteroid
          explode.play();
          spaceShip.reloadBullet();           // remove old bullet (reload) 
          background(255,0,0);
          redraw();
          return;
        }
      }
      
      // When bullet goes above top of screen
      if(spaceShip.getBullet().getY() < 0)
      {
        screenData.incScore(-100);
        spaceShip.reloadBullet();
      }
      
    }
  }

  public void help()
  {
    println("Welcome to Asteroids\n\na=LEFT\ns=RIGHT\nSPACE=FIRE\nh=HELP\nq=QUIT");
  }
}