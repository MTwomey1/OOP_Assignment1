// Minim Libraries
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

PImage startscreen, members, equalizer, history, member1, member2, member3; // Image Variables
PFont myFont; // Constant font variable

int screen; // Screen Choice variable

void setup()
{
  minim = new Minim(this); 
  player = minim.loadFile("Palm Trees.mp3", 2048); // Visualizer song
  fft = new FFT(player.bufferSize(), player.sampleRate()); //  Fast Fourier Transform params

  // Classes
  meech = new Meech();
  juice = new Juice();
  erick = new Erick();
  song1 = new Song1();
  song2 = new Song2();
  song3 = new Song3();
  collage = new Collage();

  // Set screen variable to screen 1
  screen = 1;  
  // Set screen size
  size(1901, 972, P3D);

  // Load images here to avoid memory problems
  startscreen = loadImage("C:/Users/Mark/Google Drive/DT228/2nd Year/Semester 1/Object Orientated Programming/Assignment 1/Other/Images/home3.png");
  members = loadImage("C:/Users/Mark/Google Drive/DT228/2nd Year/Semester 1/Object Orientated Programming/Assignment 1/Other/Images/members.jpg");
  equalizer = loadImage("C:/Users/Mark/Google Drive/DT228/2nd Year/Semester 1/Object Orientated Programming/Assignment 1/Other/Images/equalizer.jpg");
  history = loadImage("C:/Users/Mark/Google Drive/DT228/2nd Year/Semester 1/Object Orientated Programming/Assignment 1/Other/Images/history2.jpg");

} // End void Setup()

// Classes
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

  if (screen == 1)// 1st Screen, Opening page
  {
    background(0);

    image(startscreen, 0, 0, width, height); // Show opeing image
    textAlign(CENTER);
    stroke(255);
    text("Press any key to Enter", width / 2, height * 0.8);

    // When "any key" pressed
    if (keyPressed == true)
    {
      screen = 2; // Change to next screen
    }// End if
  }// End screen 1 (Opening)

  if (screen == 2) // 2nd Screen, Main menu
  {
    background(0);
    String menu = "Main Menu"; // Main menu display text
    stroke(255);
    fill(255);
    text(menu, width / 2, height * 0.1);
    strokeWeight(5);
    line ((width / 2) - (textWidth(menu) / 2), height * 0.12, (width / 2) + (textWidth(menu) / 2), height * 0.12);// Underline "Main Menu"
    
    // Text for menu options
    text("Members", width / 6, height * 0.2);
    text("Music", (width / 4) * 2, height * 0.2);
    text("History", (width / 6) * 5, height * 0.2);
    // Underlines for menu options text
    line(0, height * 0.25, width, height * 0.25);// Horizontal under categories
    line(width / 3, height * 0.25, width / 3, height);// 1st Vertical
    line((width / 3) * 2, height * 0.25, (width / 3) * 2, height);// 2nd Vertical


    // 1st menu option "Members"
    if (mouseX < width / 3 && mouseY > height * 0.25) // if mouse within option 1 image
    {
      tint(255, 255); // Opacity full 100%
      image(members, 1, height * 0.255, width / 3 - 1, height);// Members image shown 100%
      if (mousePressed == true) // If user clicked option
      {
        screen = 3;// Go to Members screen
      }// End 2nd if
    } // End 1st if 
    else
    {
      tint(255, 150); // Opacity NOT full
      image(members, 1, height * 0.255, width / 3 - 1, height);// Members image shown
    }// End else

    // 2nd menu option "Music"
    if (mouseX > width / 3 && mouseX < (width / 3) * 2 && mouseY > height * 0.25) // if mouse within option 2 image
    {
      tint(255, 255); // Opacity full 100%
      image(equalizer, (width / 3) + 2, height * 0.255, width / 3 - 1, height);// Equalizer image shown 100%
      if (mousePressed == true) // If user clicked option
      {
        screen = 4;// Go To Music screen
      } // End 2nd if
    } // End 1st if
    else
    {
      tint(255, 150); // Opacity NOT full
      image(equalizer, (width / 3) + 2, height * 0.255, width / 3 - 1, height);// Equalizer image shown
    } // End else

    // 3rd menu option "History"
    if (mouseX  > (width  / 3) * 2 && mouseY > height * 0.255) // if mouse within option 3 image
    {
      tint(255, 255); // Opacity full 100%
      image(history, ((width / 3) * 2) + 2, height * 0.255, width / 3 - 1, height);// History image shown 100%
      if (mousePressed == true) // If user clicked option
      {
        screen = 5;// Go to History Screen
      } // End 2nd if
    }// End 1st if
    else
    {
      tint(255, 200); // Opacity NOT full
      image(history, ((width / 3) * 2) + 2, height * 0.255, width / 3 - 1, height);// History image shown
    } // End else
    
    // [ Q ] to Quit option
    textSize(30);
    text("[Q] = Quit", width * 0.05, height * 0.05);   
    if (keyPressed == true)
    {
      if (key == 'q' || key == 'Q')
      {
        screen = 1;// Return To startscreen
      } // End 2nd if
    } // End 1st if
  }// End screen 2

  if (screen == 3)  // 3rd Screen, Members Soundboard
  {
    background(0);
    String mem = "Members Soundboard";
    String names[] = {
      "Meechy Darko", "Zombie Juice", "Erick Arc Elliott"
    };
    text(mem, width / 2, height * 0.1);
    strokeWeight(5);
    line ((width / 2) - (textWidth(mem) / 2), height * 0.12, (width / 2) + (textWidth(mem) / 2), height * 0.12);// Underline "Members"
    
    // Display members
    meech.display();
    juice.display();
    erick.display();
    
    // Display member names
    float x = 0.215;
    for (int i = 0; i < 3; i++)
    {
      text(names[i], width * x, height * 0.9);
      line(width * x - (textWidth(names[i]) / 2), height * 0.91, width * x + (textWidth(names[i]) / 2), height * 0.91);
      x += 0.3;
    }

    if (mousePressed == true) // Check which member clicked
    {
      if ((mouseX > width * 0.1) && (mouseX < (width * 0.1) + width / 4.2) && (mouseY > height * 0.15) && (mouseY < (height * 0.15 + height / 1.5) ))
      {
        meech.speak(); // Meech says his name
      }
      if ((mouseX > width * 0.4) && (mouseX < (width * 0.4) + width / 4.2) && (mouseY > height * 0.15) && (mouseY < (height * 0.15 + height / 1.5) ))
      {
        juice.speak(); // Juice says his name
      }
      if ((mouseX > width * 0.7) && (mouseX < (width * 0.7) + width / 4.2) && (mouseY > height * 0.15) && (mouseY < (height * 0.15 + height / 1.5) ))
      {
        erick.speak(); // Erick says his name
      }
    }
    
    // Return to main menu option
    textSize(30);
    text("[M] = Main Menu", width * 0.1, height * 0.1);
    if (keyPressed == true)
    {
      if (key == 'm' || key == 'M')
      {
        screen = 2;
      } // End 2nd if
    }// End 1st if
  }// End screen 3

  if (screen == 4)  //4th Screen, Music Player
  {
    background(0);
    stroke(255);
    String music = "Flatbush Zombies Music";
    text(music, width / 2, height * 0.1);
    line ((width / 2) - (textWidth(music) / 2), height * 0.12, (width / 2) + (textWidth(music) / 2), height * 0.12);// Underline "Music" 
    
    // main menu option
    textSize(30);
    text("[M] = Main Menu", width * 0.1, height * 0.1);
    if (keyPressed == true)
    {
      if (key == 'm' || key == 'M')
      {
        screen = 2;
      }
    }
    
    textSize(60);
    text("Press [V] for Visualizer", width / 2, height * 0.9);
    if (keyPressed == true)
    {
      if (key == 'v' || key == 'V')
      {
        screen = 6;
      }
    }
    
    // Display mp3 metadata
    song1.display();
    song2.display();
    song3.display();
    
    
  }// End screen 4, Music Player

  if (screen == 5) // 5th screen, History Page
  {
    background(0);
    String info = "About Flatbush Zombies";
    text(info, width / 2.8, height * 0.1);
    line ((width / 2) - (textWidth(info) / 2), height * 0.12, (width / 2) + (textWidth(info) / 2), height * 0.12);// Underline "About F.B."

     noFill(); // White Text box option
     rect(width * 0.5, height * 0.18, width * 0.49, height * 0.8, 7);
     
     // Read in text file with data about group     
     String about[] = loadStrings("about.txt");
     float y;
     y = height * 0.22;
     for (int i = 0 ; i < about.length; i++) // Display File line by line
     {
       textSize(30);
       textAlign(LEFT);
       text(about[i], width * 0.52, y);
       y += 30;
     }
     
     // Display 3 pictures together  
     collage.display();
    
    // Return main menu option 
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
  
  if(screen == 6) // 6th Screen, Visualizer page
  {
    background(0);
    // User controls
    textSize(30);
    text("[B] = Back", width * 0.9, height * 0.05);
    text("[ 1 ] & [ 2 ] = Change Visual", width * 0.9, height * 0.1);
    text("[ P ] & [ S ] = Play & Stop", width * 0.9, height * 0.15);
    if(key == 'p' || key == 'P') // Play music option
    {
      player.play();
    }
    if(key == 's' || key == 'S') // Stop music option
    {
      player.pause();
      player.rewind();
    }
   if(key == '1') // 1st visualizer
   { 
     stroke(random(255), random(255),0);
     for(int i = 0; i < player.bufferSize(); i ++)
     {
      float sample = player.left.get(i);
      
      sample *= 500;
      line(i, height / 2, i,  (height / 2) + sample);
     }
   }
  if(key == '2') // 2nd visualizer
  { 
    fft.window(FFT.HAMMING);
    fft.forward(player.left);
    stroke(random(255), random(255),0);
    for (int i = 0 ; i < fft.specSize() ; i ++)
    {
      line(i, height, i, height - fft.getBand(i)*100);
    }
  }
  
  // Go back option
  if(key == 'b' || key == 'B')
  {
    screen = 4;  
  }
    
  } // End screen 6
  
}// End void draw()

