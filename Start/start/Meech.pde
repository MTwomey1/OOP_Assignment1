// Group member Meech
class Meech
{
  PImage image;
  AudioPlayer audio;
  
  Meech()
  {
    // Loading files
    image = loadImage("member1.jpg");
    audio = minim.loadFile("voice1.mp3");
  }
  
  void display()
  {
    if((mouseX > width * 0.1) && (mouseX < (width * 0.1) + width / 4.2) && (mouseY > height * 0.15) && (mouseY < (height * 0.15 + height / 1.5) ))
    {
      tint(255, 255);
      image(image, (width * 0.1) , height * 0.15, width / 4.2, height / 1.5);
    }
    else
    {
      tint(255, 150);
      image(image, (width * 0.1) , height * 0.15, width / 4.2, height / 1.5);
    }
  }// End display()
  
  void speak()
  {
    audio.rewind();// Rewinds audio to beginning
    audio.play(); 
  }// End speak()
  
}// End class Meech
