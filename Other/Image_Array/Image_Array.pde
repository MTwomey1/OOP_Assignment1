PImage p0, p1;

PImage [] picArray = new PImage [8];

void setup()
{
  size(1000, 700);
  
  p0 = loadImage("0.png");
  p1 = loadImage("1.png");
  
  picArray[0] = p0;
  picArray[1] = p1;
}

void draw()
{
  background(0);
  image(picArray[1], mouseX, mouseY)
}

void mousePressed()
{
  image(picArray[int(random(picArray.length))], mouseX, mouseY);
}

