// Song: Palm Trees
class Song2
{
  PImage image;
  AudioPlayer play;
  AudioMetaData meta;

Song2()
{ 
  image = loadImage("play.png");
  play = minim.loadFile("Palm Trees.mp3");
  meta = play.getMetaData();
}

int ys = 450;// Y Position
int yi = 50; // Gaps
int x = 950;// X Position

void display()
{
  // Metadata display
  image(image, 800, 150, 300, 150);
  int y = ys;
  textFont(createFont("Serif", 20));
  text("Title: " + meta.title(), x, y);
  text("File Name: " + meta.fileName(), x, y+=yi);
  text("Length (in milliseconds): " + meta.length(), x, y+=yi);
  text("Author: " + meta.author(), x, y+=yi); 
  text("Album: Better off DEAD" + meta.album(), x, y+=yi);
  text("Genre: Rap & Hip-Hop" + meta.genre(), x, y+=yi);
  
  // Media player
  if(mousePressed == true)
  {
    if(mouseX > 800 && mouseX < 887 && mouseY > 152 && mouseY < 296)
    {
      play.play();
    }
    if(mouseX > 905 && mouseX < 994 && mouseY > 152 && mouseY < 296)
    {
      play.pause();
    }
    if(mouseX > 1009 && mouseX < 1095 && mouseY > 152 && mouseY < 296)
    {
      play.pause();
      play.rewind();
    }
    
  }
}

void stop()
{
  // always close Minim audio classes when you are done with them
  play.close();
  // always stop Minim before exiting
  minim.stop();
}
}
