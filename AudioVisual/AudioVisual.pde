import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;

Minim minim;
AudioPlayer player;
AudioInput input;

void setup()
{
  frameRate(20);
  size(2048, 1024);
  smooth();
  minim = new Minim(this);
  fft = new FFT(width, sampleRate);

  player = minim.loadFile("song2.mp3", 2048);
  player.play();
    
}


FFT fft;
int sampleRate = 44100;

void draw()
{
  background(0);
  stroke(random(255), random(255),0);
 for (int i = 0 ; i < player.bufferSize(); i ++)
  {
    float sample = player.left.get(i);
    
    sample *= 500;
    line(i, height / 2, i,  (height / 2) + sample);
  } 
  fft.window(FFT.HAMMING);
  fft.forward(player.left);
  stroke(random(255), random(255),0);
  for (int i = 0 ; i < fft.specSize() ; i ++)
  {
    line(i, height, i, height - fft.getBand(i)*100);
  }
  
}

void stop()
{
  player.close();
  minim.stop();
  super.stop();
}
