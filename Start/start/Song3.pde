// Somg: No Religion
class Song3
{
  PImage image;
  AudioPlayer play;
  AudioMetaData meta;

Song3()
{ 
  image = loadImage("play.png");
  play = minim.loadFile("No Religion.mp3");
  meta = play.getMetaData();
}

int ys = 450;// Y Position
int yi = 50; // Gaps
int x = 1650;// X Position

void display()
{
  // Metadata display
  image(image, 1500, 150, 300, 150);
  int y = ys;
  textFont(createFont("Serif", 20));
  text("Title: " + meta.title(), x, y);
  text("File Name: " + meta.fileName(), x, y+=yi);
  text("Length (in milliseconds): " + meta.length(), x, y+=yi);
  text("Author: " + meta.author(), x, y+=yi); 
  text("Album: " + meta.album(), x, y+=yi);
  text("Genre: " + meta.genre(), x, y+=yi);
  
  // Media player
  if(mousePressed == true)
  {
    if(mouseX > 1500 && mouseX < 1587 && mouseY > 152 && mouseY < 296)
    {
      play.play();
    }
    if(mouseX > 1606 && mouseX < 1692 && mouseY > 152 && mouseY < 296)
    {
      play.pause();
    }
    if(mouseX > 1709 && mouseX < 1795 && mouseY > 152 && mouseY < 296)
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
