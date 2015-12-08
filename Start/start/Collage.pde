class Collage
{
  PImage image1, image2, image3, image4;
  
  Collage()
  {
    image1 = loadImage("about (1).jpg");
    image2 = loadImage("about (2).jpg");
    image3 = loadImage("about (3).jpg");
    image4 = loadImage("about (4).jpg");
  }
  
  void display()
  {
    float y;
    y = height * 0.2;
    image(image2, width * 0.05, y, width / 2.5, height / 4);
    image(image4, width * 0.05, y += height / 4, width / 2.5, height / 4);
    image(image3, width * 0.05, y += height / 4, width / 2.5, height / 4);   
    
  }// End display()
    
}// End class Collage

