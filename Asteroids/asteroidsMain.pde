Game game;
import processing.sound.*;

SoundFile background;
SoundFile fire;
SoundFile explode;

void setup()
{
  background = new SoundFile(this, "background.wav");
  fire = new SoundFile(this, "fire.wav");
  explode = new SoundFile(this, "explode.wav");
  
  size(600, 600);
  game = new Game();
  game.help();
  background.loop();
}

void draw()
{
  background(0, 0, 0);
  game.update();
} 

void keyPressed()
{  
  if (key=='a')
    game.action(Game.LEFT);

  if (key=='s')
    game.action(Game.RIGHT);

  if (key==' ')
    game.action(Game.FIRE);

  if (key=='q')
    exit();

  if (key=='h')
    game.help();
}