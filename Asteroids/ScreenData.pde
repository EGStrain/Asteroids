public class ScreenData
{
  private int score;
  private int lives;
  private int level;

  public ScreenData()
  {
    score=0;
    lives=Game.INITIAL_LIVES;
    level=1;
  }
  
  //getters and setters
  public int getScore()
  {
     return this.score; 
  }
  
  public void setScore(int score)
  {
    this.score = score;
  }
  
  public void incScore(int value)
  {
    this.score +=value;
  }
  
  public int getLives()
  {
  return this.lives; 
  }
  
  public void setLives(int lives)
  {
    this.lives = lives;
  }
  
  public void addLife()
  {
    this.lives += 1;
  }
  
    public void loseLife()
  {
    this.lives -= 1;
  }
  
  public int getLevel()
  {
     return this.level; 
  }
  
  public void incLevel()
  {
    this.level += 1;
  }
  
  public void display()
  {       
    fill(170,170,170);
    textSize(32);
    text(this.score, 10,32);
    text("L"+this.lives,300,32);
    text(this.level,550,32);
  }
  
  @Override
  public String toString()
  {
     return "[ScreenData:score="+this.score+";lives="+this.lives+";level="+this.level+"]"; 
  }
}