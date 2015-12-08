// Group member Erick
class Erick
{
  PImage image;
  AudioPlayer audio;
  
  Erick()
  {
    // Loading files
    image = loadImage("member3.jpg");
    audio = minim.loadFile("voice3.mp3");
  }
  
  void display()
  {
    if((mouseX > width * 0.7) && (mouseX < (width * 0.7) + width / 4.2) && (mouseY > height * 0.15) && (mouseY < (height * 0.15 + height / 1.5) ))
    {
      tint(255, 255);
      image(image, (width * 0.7) , height * 0.15, width / 4.2, height / 1.5);
    }
    else
    {
      tint(255, 150);
      image(image, (width * 0.7) , height * 0.15, width / 4.2, height / 1.5);
    }
  }// End display()
  
  void speak()
  {
    audio.rewind();// Rewinds audio to beginning
    audio.play(); 
  }// End speak()
  
}// End class Erick
