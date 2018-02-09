public class Bullet extends SpaceObject
{
  public Bullet(int x)
  {    
    super(x,height-25,2,8);
  }
  
  public void display()
  {
    fill(266, 0, 0);
    stroke(153);

    pushMatrix();
    super.y=super.y-((int)super.speed*1);    
    translate(super.x, super.y);
    polygon(0, 0, super.radius, 5);    
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