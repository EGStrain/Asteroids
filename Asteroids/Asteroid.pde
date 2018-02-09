public class Asteroid extends SpaceObject implements Shootable
{
  public Asteroid()
  {
    super((int)random(Game.MAX_ASTEROID_SIZE-(Game.MAX_ASTEROID_SIZE/2), width-Game.MAX_ASTEROID_SIZE),0,(int)random(1, 5)*10,random(0.5, 2));
  }

  public int getScoreValue()
  {
    if (super.radius == 50)
    {
      return 100;
    }
    else if (super.radius == 40)
    {
     return 200; 
    }
    else if (super.radius == 30)
    {
     return 300; 
    }
    else if (super.radius == 20)
    {
     return 400; 
    }
    else
    {
     return 500; 
    }
  }  
  
  public boolean hitBy(Bullet bullet)
  {
    if (dist(bullet.getX(), bullet.getY(), super.x, super.y*super.speed) < super.radius)
    {
      return true;
    }
    else
    {
      return false;
    }
  }

  public void display()
  {
    noFill();
    stroke(153);

    pushMatrix();
    super.y++;
    translate(super.x, super.y*super.speed);
    polygon(0, 0, super.radius, 7);
    popMatrix(); 

    //// uncomment to see size of asteroid
    //textSize(32);
    //fill(153);
    //text(radius, x, y*speed);
  }

  private void polygon(float x, float y, float radius, int npoints)
  {
    float angle = TWO_PI / npoints;
    beginShape();
    for (float a = 0; a < TWO_PI; a += angle) {
      float sx = x + cos(a) * radius;
      float sy = y + sin(a) * radius;
      vertex(sx, sy);
    }
    endShape(CLOSE);
  }
}