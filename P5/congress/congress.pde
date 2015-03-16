import codeanticode.syphon.*;
import controlP5.*;

ControlP5 cp5;
RadioButton r;
PGraphics canvas;
SyphonServer server;

int index = 0;
int offset = 0;

void setup() {
  size(640, 360, P3D);
  frameRate(30);
  
  canvas = createGraphics(640, 360, P3D);  
  server = new SyphonServer(this, "congress");
  
  cp5 = new ControlP5(this);
  r = cp5.addRadioButton("radioButton")
         .setPosition(20,20)
         .setSize(40,20)
         .setColorForeground(color(120))
         .setColorActive(color(255))
         .setColorLabel(color(255))
         .setItemsPerRow(5)
         .setSpacingColumn(10)
         .addItem("1",0)
         .addItem("2",1)
         .addItem("3",2)
         .addItem("4",3)
         .addItem("5",4)
         ;
}

void draw() {
  canvas.beginDraw();
    canvas.background(0);
    canvas.smooth();
    //canvas.lights();
    canvas.translate(width/2, height/2);
    canvas.pushStyle();
      pattern(index);
    canvas.popStyle();
  canvas.endDraw();
  image(canvas, 0, 0);
  server.sendImage(canvas);
}

void pattern(int num) {
  switch(num) {
    case 0: 
      canvas.rotateX(frameCount * 0.01);
      canvas.rotateY(frameCount * 0.01);  
      canvas.strokeWeight(10);
      canvas.box(150);
      break;
    case 1: 
      canvas.rotateX(frameCount * 0.01);
      canvas.rotateY(frameCount * 0.01); 
      canvas.strokeWeight(5); 
      canvas.sphere(150);
      break;
    case 2: 
      if (offset % 500 == 0) offset = 0;
      offset += 2;
      for (int i = 0; i < 10; i++) {
        canvas.noFill();
        canvas.stroke(255);
        canvas.strokeWeight(15);
        int val = (i * 50) + offset;
        canvas.ellipse(0, 0, val, val);
      }
      break;
    case 3: 
      if (offset % 500 == 0) offset = 0;
      offset += 1;
      for (int i = 0; i < 10; i++) {
        canvas.noFill();
        canvas.stroke(255);
        canvas.strokeWeight(10);
        int val = (i * 50) + offset;
        canvas.triangle(
          0, (-25) - val, 
          (-25) - val, 25 + val, 
          (25) + val, (25) + val
        );
      }
      break;
    case 4: 
      if (offset % 250 == 0) offset = 0;
      offset += 1;
      for (int i = 0; i < 10; i++) {
        canvas.noFill();
        canvas.stroke(255);
        canvas.strokeWeight(20);
        int val = (i * 50) + offset;
        canvas.rect(0 - val, 0 - val, val* 2, val*2);
      }
      break;
  }
}

void keyPressed() {
  //index = key - 48;
}

void radioButton(int num) {
  index = num;
}

