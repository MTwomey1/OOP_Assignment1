class Song1
{
  PImage image;
  AudioPlayer play;
  AudioMetaData meta;

Song1()
{ 
  image = loadImage("play.png");
  play = minim.loadFile("MRAZ.mp3");
  meta = play.getMetaData();
}

int ys = 450;// Y Position
int yi = 50; // Gaps
int x = 200;// X Position

void display()
{
  image(image, 50, 150, 300, 150);
  int y = ys;
  textFont(createFont("Serif", 20));
  text("Title: " + meta.title(), x, y);
  text("File Name: " + meta.fileName(), x, y+=yi);
  text("Length (in milliseconds): " + meta.length(), x, y+=yi);
  text("Author: " + meta.author(), x, y+=yi); 
  text("Album: " + meta.album(), x, y+=yi);
  text("Genre: " + meta.genre(), x, y+=yi);
  
 
  if(mousePressed == true)
  {
    if(mouseX > 52 && mouseX < 132 && mouseY > 152 && mouseY < 296)
    {
      play.play();
    }
    if(mouseX > 157 && mouseX < 242 && mouseY > 152 && mouseY < 296)
    {
      play.pause();
    }
    if(mouseX > 258 && mouseX < 345 && mouseY > 152 && mouseY < 296)
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
