public abstract class SpaceObject
{
   private int x;
   private int y;
   private int radius;
   private float speed;
   
   public SpaceObject()
   {
     this.x = 0;
     this.y = 0;
     this.radius = 0;
     this.speed = 0;
   }
   
   public SpaceObject(int x, int y, int radius, float speed)
   {
     this.x = x;
     this.y = y;
     this.radius = radius;
     this.speed = speed;
   }
   
   //Class Methods
   public int getX()
   {
      return this.x; 
   }
   
   public void setX(int x)
   {
      this.x = x; 
   }
   
   public void incX()
   {
      this.x += 1; 
   }
   
   public int getY()
   {
      return this.y; 
   }
   
   public void setY(int y)
   {
      this.y = y; 
   }
   
   public void incY()
   {
      this.y += 1; 
   }
   
   public int getRadius()
   {
      return this.radius; 
   }
   
   public void setRadius(int radius)
   {
     this.radius = radius;
   }
  
   public float getSpeed()
   {
      return this.speed; 
   }
   
   public void setSpeed(float speed)
   {
     this.speed = speed;
   }
   
   public abstract void display();
   
   @Override
   public String toString()
   {
     return "[SpaceObject:x="+this.x+";y="+this.y+";radius="+this.radius+";speed="+this.speed+"]";
   }
}