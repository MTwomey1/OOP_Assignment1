import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;
import ddf.minim.*;

Minim minim;
AudioPlayer player;
FFT fft;
AudioInput input;

PImage startscreen, members, equalizer, history, member1, member2, member3;
PFont myFont;

int screen;
void setup()
{
  minim = new Minim(this); 
  player = minim.loadFile("Palm Trees.mp3", 2048);
  fft = new FFT(player.bufferSize(), player.sampleRate());

  meech = new Meech();
  juice = new Juice();
  erick = new Erick();
  song1 = new Song1();
  song2 = new Song2();
  song3 = new Song3();
  collage = new Collage();


  screen = 1;  
  //size(round(displayWidth * 0.99), round(displayHeight * 0.9));  //1901 x 972
  size(1901, 972, P3D);


  // Load images here to avoid memory problems
  startscreen = loadImage("C:/Users/Mark/Google Drive/DT228/2nd Year/Semester 1/Object Orientated Programming/Assignment 1/Other/Images/home3.png");
  members = loadImage("C:/Users/Mark/Google Drive/DT228/2nd Year/Semester 1/Object Orientated Programming/Assignment 1/Other/Images/members.jpg");
  equalizer = loadImage("C:/Users/Mark/Google Drive/DT228/2nd Year/Semester 1/Object Orientated Programming/Assignment 1/Other/Images/equalizer.jpg");
  history = loadImage("C:/Users/Mark/Google Drive/DT228/2nd Year/Semester 1/Object Orientated Programming/Assignment 1/Other/Images/history2.jpg");

  /* Show Available fonts
   String[] fontList = PFont.list();
   printArray(fontList);*/
}

Meech meech;
Juice juice;
Erick erick;
Song1 song1;
Song2 song2;
Song3 song3;
Collage collage;


void draw()
{
  // Maintain Font through pages
  myFont = createFont("Bernard MT Condensed", 60);
  textFont(myFont);

  if (screen == 1)
  {
    background(0);

    image(startscreen, 0, 0, width, height);
    textAlign(CENTER);
    stroke(255);
    text("Press any key to Enter", width / 2, height * 0.8);

    // When "any key" pressed
    if (keyPressed == true)
    {
      screen = 2;
    }// End if
  }// End screen 1

  if (screen == 2)
  {
    background(0);
    String menu = "Main Menu";
    stroke(255);
    fill(255);
    text(menu, width / 2, height * 0.1);

    strokeWeight(5);
    line ((width / 2) - (textWidth(menu) / 2), height * 0.12, (width / 2) + (textWidth(menu) / 2), height * 0.12);// Underline "Main Menu"

    text("Members", width / 6, height * 0.2);
    text("Music", (width / 4) * 2, height * 0.2);
    text("History", (width / 6) * 5, height * 0.2);

    line(0, height * 0.25, width, height * 0.25);// Horizontal under categories
    line(width / 3, height * 0.25, width / 3, height);// 1st Vertical
    line((width / 3) * 2, height * 0.25, (width / 3) * 2, height);// 2nd Vertical


    // 1st Box
    if (mouseX < width / 3 && mouseY > height * 0.25)
    {
      tint(255, 255);
      image(members, 1, height * 0.255, width / 3 - 1, height);// Members image
      if (mousePressed == true)
      {
        screen = 3;// Members screen
      }
    } else
    {
      tint(255, 150);
      image(members, 1, height * 0.255, width / 3 - 1, height);// Members image
    }

    // 2nd Box
    if (mouseX > width / 3 && mouseX < (width / 3) * 2 && mouseY > height * 0.25)
    {
      tint(255, 255);
      image(equalizer, (width / 3) + 2, height * 0.255, width / 3 - 1, height);// Equalizer image
      if (mousePressed == true)
      {
        screen = 4;// Music screen
      }
    } else
    {
      tint(255, 150);
      image(equalizer, (width / 3) + 2, height * 0.255, width / 3 - 1, height);// Equalizer image
    }

    // 3rd Box
    if (mouseX  > (width  / 3) * 2 && mouseY > height * 0.255)
    {
      tint(255, 255);
      image(history, ((width / 3) * 2) + 2, height * 0.255, width / 3 - 1, height);// History image
      if (mousePressed == true)
      {
        screen = 5;// History Screen
      }
    } else
    {
      tint(255, 200);
      image(history, ((width / 3) * 2) + 2, height * 0.255, width / 3 - 1, height);// History image
    }


    if (keyPressed == true)
    {
      if (key == 'q' || key == 'Q')
      {
        screen = 1;// To startscreen
      }
    }
  }// End screen 2

  // Members screen
  if (screen == 3)
  {
    background(0);
    String mem = "Members Soundboard";
    String names[] = {
      "Meechy Darko", "Zombie Juice", "Erick Arc Elliott"
    };
    text(mem, width / 2, height * 0.1);
    strokeWeight(5);
    line ((width / 2) - (textWidth(mem) / 2), height * 0.12, (width / 2) + (textWidth(mem) / 2), height * 0.12);// Underline "Members"

    meech.display();
    juice.display();
    erick.display();

    float x = 0.215;
    for (int i = 0; i < 3; i++)
    {
      text(names[i], width * x, height * 0.9);
      line(width * x - (textWidth(names[i]) / 2), height * 0.91, width * x + (textWidth(names[i]) / 2), height * 0.91);
      x += 0.3;
    }

    if (mousePressed == true)
    {
      if ((mouseX > width * 0.1) && (mouseX < (width * 0.1) + width / 4.2) && (mouseY > height * 0.15) && (mouseY < (height * 0.15 + height / 1.5) ))
      {
        meech.speak();
      }
      if ((mouseX > width * 0.4) && (mouseX < (width * 0.4) + width / 4.2) && (mouseY > height * 0.15) && (mouseY < (height * 0.15 + height / 1.5) ))
      {
        juice.speak();
      }
      if ((mouseX > width * 0.7) && (mouseX < (width * 0.7) + width / 4.2) && (mouseY > height * 0.15) && (mouseY < (height * 0.15 + height / 1.5) ))
      {
        erick.speak();
      }
    }

    textSize(30);
    text("[M] = Main Menu", width * 0.1, height * 0.1);
    if (keyPressed == true)
    {
      if (key == 'm' || key == 'M')
      {
        screen = 2;
      }
    }
  }// End screen 3

  //Music screen
  if (screen == 4)
  {
    background(0);
    stroke(255);
    String music = "Flatbush Zombies Music";
    text(music, width / 2, height * 0.1);
    line ((width / 2) - (textWidth(music) / 2), height * 0.12, (width / 2) + (textWidth(music) / 2), height * 0.12);// Underline "Music" 

    textSize(30);
    text("[M] = Main Menu", width * 0.1, height * 0.1);
    if (keyPressed == true)
    {
      if (key == 'm' || key == 'M')
      {
        screen = 2;
      }
    }
    
    textSize(30);
    text("Press [V] for Visualizer", width / 2, height * 0.9);
    if (keyPressed == true)
    {
      if (key == 'v' || key == 'V')
      {
        screen = 6;
      }
    }
    
    song1.display();
    song2.display();
    song3.display();
    
    
  }// End screen 4

  // History Screen
  if (screen == 5)
  {
    background(0);
    String info = "About Flatbush Zombies";
    text(info, width / 2.8, height * 0.1);
    line ((width / 2) - (textWidth(info) / 2), height * 0.12, (width / 2) + (textWidth(info) / 2), height * 0.12);// Underline "About F.B."

     noFill();
     rect(width * 0.5, height * 0.18, width * 0.49, height * 0.8, 7);
     
     
     String about[] = loadStrings("about.txt");
     float y;
     y = height * 0.22;
     for (int i = 0 ; i < about.length; i++) 
     {
       textSize(30);
       textAlign(LEFT);
       text(about[i], width * 0.52, y);
       y += 30;
     }
     
     
     
     collage.display();
     
    textSize(30);
    text("[M] = Main Menu", width * 0.1, height * 0.1);
    if (keyPressed == true)
    {
      if (key == 'm' || key == 'M')
      {
        screen = 2;
        textAlign(CENTER);
        
      }
    }
  }// End screen 5 (History)
  
  if(screen == 6)
  {
    background(0);
    textSize(30);
    text("[B] = Back", width * 0.9, height * 0.05);
    text("[ 1 ] & [ 2 ] = Change Visual", width * 0.9, height * 0.1);
    text("[ P ] & [ S ] = Play & Stop", width * 0.9, height * 0.15);
    if(key == 'p' || key == 'P')
    {
      player.play();
    }
    if(key == 's' || key == 'S')
    {
      player.pause();
      player.rewind();
    }
   if(key == '1')
   { 
     stroke(random(255), random(255),0);
     for(int i = 0; i < player.bufferSize(); i ++)
     {
      float sample = player.left.get(i);
      
      sample *= 500;
      line(i, height / 2, i,  (height / 2) + sample);
     }
   }
  if(key == '2')
  { 
    fft.window(FFT.HAMMING);
    fft.forward(player.left);
    stroke(random(255), random(255),0);
    for (int i = 0 ; i < fft.specSize() ; i ++)
    {
      line(i, height, i, height - fft.getBand(i)*100);
    }
  }
  if(key == '3')
  { 
    fft.window(FFT.HAMMING);
    fft.forward(player.left);
    stroke(random(255), random(255),0);
    for (int i = 0 ; i < fft.specSize() ; i ++)
    {
      line(i, height, i, height - fft.getBand(i)*100);
    }
  }
  if(key == 'b' || key == 'B')
  {
    screen = 4;  
  }
    
  } // End screen 6
  
}// End void draw()

