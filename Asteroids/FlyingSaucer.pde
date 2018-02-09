public class FlyingSaucer extends SpaceObject implements Shootable
{
  public FlyingSaucer()
  { 
    super(0,50,20,3);
  }

  public boolean hitBy(Bullet bullet)
  {
    if (dist(bullet.getX(), bullet.getY(), super.x*super.speed, super.y) < super.radius)        
      return true;
    else
      return false; 
  }
  
  public boolean visible()
  {
     if(getX()<600)
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
    fill(255);
    stroke(153);

    pushMatrix();
    super.x++;
    translate(super.x*super.speed, super.y);
    polygon(0, 0, super.radius, 4);
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