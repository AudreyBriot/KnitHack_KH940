import processing.video.*;
import controlP5.*;

Capture cam;

ControlP5 cp5;
Slider abc;

// Bayer matrix
int[][] matrix = {   
  {
    1, 9, 3, 11
  }
  , 
  {
    13, 5, 15, 7
  }
  , 
  {
    4, 12, 2, 10
  }
  , 
  {
    16, 8, 14, 6
  }
};

float mratio = 1.0 / 17;
float mfactor = 255.0 / 5;

float threshold = 75;

PImage destination;

int width_px = 320;
int height_px = 240;
int frame = 25;

int margin = 0;
int margin_left = 120;

void setup() {
  size(80, 140);
  noStroke();
  cam = new Capture(this, width_px, height_px, frame);
  cam.start();
  destination = createImage(cam.width, cam.height, RGB);
  
  cp5 = new ControlP5(this);
      
  // add a vertical slider
  cp5.addSlider("threshold")
     .setPosition(0,0)
     .setSize(200,15)
     .setRange(0,200)
     .setValue(128)
     ;
}

void draw() {
  if(cam.available()) {
    cam.read();
  }
  cam.loadPixels();
  //image(cam, -margin_left ,margin);
  destination.loadPixels();
   
    for (int x = 0; x < cam.width; x++) {
    for (int y = 0; y < cam.height; y++ ) {
      int loc = x + y*cam.width;
      // Test the brightness against the threshold
      color oldpixel = cam.pixels[loc];
      color value = color( brightness(oldpixel) + (mratio*matrix[x%4][y%4] * mfactor));
      color newpixel = findClosestColor(value);
      
      destination.set(x, y, newpixel);

      // Draw
      //stroke(newpixel);   
      //point(x, y);
    }
  }

  // We changed the pixels in destination
  destination.updatePixels();
  // Display the destination
  image(destination,-margin_left,margin);
  
  if ( keyPressed ) {
  saveFrame("knit-####.png");
  }
}

void slider(float theThreshold) {
  threshold = theThreshold;
  //println("setting threshold to "+theColor);
}

color findClosestColor(color in) {  
  color out;
  if (brightness(in) < threshold) {
    out = color(0);
  }
  else {
    out = color(255);
  }
  return out;
}

