public class SpaceShip extends SpaceObject
{
  Bullet bullet;

  public SpaceShip()
  {
    super(width/2,height-25,20,0);
  }

  void incX(int direction) throws OutOfScreenException
  {
    super.x += direction;
    
    if(super.x <0 || super.x >600)
    {
      super.x -= direction;
      throw new OutOfScreenException();
    }
  }

  public void reloadBullet()
  {
    bullet=null;
  }

  public Bullet getBullet()
  {
    return bullet;
  }

  public void fire()
  {
    bullet = new Bullet(super.x);
  }
  
  public void display()
  {
    fill(123);
    stroke(153);

    pushMatrix();
    polygon(super.x, super.y, super.radius, 4);
    rotate(PI);
    popMatrix();
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