import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

Minim minim;
AudioPlayer player;
AudioInput input;

void setup()
{
size(100, 100);

minim = new Minim(this);
player = minim.loadFile("song.mp3");
input = minim.getLineIn();
player.play();
}

void draw()
{

}

void stop() 
{
player.close();
input.close();
minim.stop();
super.stop();
}

