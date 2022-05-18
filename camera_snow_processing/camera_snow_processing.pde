import gab.opencv.*;
import processing.video.*;
import java.awt.Rectangle;

Capture cam;
OpenCV opencv;
Rectangle[] faces;

PImage img1, img2, img3, img4, img5, img6, img7, img8;

int saveCount=0;

void setup() {
  size(640, 480);
  //  String[] cameras = Capture.list();

  //  for (int i = 0; i < cameras.length; i++) {
  //   println("[" + i + "]" + cameras[i]);

  minim = new Minim(this);
  player1 = minim.loadFile("camera.mp3");
  player2 = minim.loadFile("dog.mp3");
  player3 = minim.loadFile("cat.mp3");
  player4 = minim.loadFile("kirakira.mp3");
  player5 = minim.loadFile("jump.mp3");
  player6 = minim.loadFile("pon.mp3");
  player7 = minim.loadFile("hige.mp3");
  player8 = minim.loadFile("koara.mp3");
  // }

  cam = new Capture(this, width, height);
  cam.start();

  img1 = loadImage("rat.png");
  img2 = loadImage("panda.png");
  img3 = loadImage("cat.png");
  img4 = loadImage("dog.png");
  img5 = loadImage("koara.png");
  img6 = loadImage("usagi.png");
  img7 = loadImage("kirakira.png");
  img8 = loadImage("hige.png");

}


void draw() {
  cam.read();
  image(cam, 0, 0);

  opencv = new OpenCV(this, cam);
  opencv.loadCascade(OpenCV.CASCADE_FRONTALFACE);
  faces = opencv.detect();

  for (int i = 0; i < faces.length; i++) {

    if ((keyPressed == true) && (key == '2')) {
      image(img2, faces[i].x, faces[i].y-50, faces[i].width+20, faces[i].height+20);
      player6.play();
      player6.rewind();
    } else if ((keyPressed == true) && (key == '3')) {
      image(img3, faces[i].x, faces[i].y, faces[i].width+20, faces[i].height+50);
      player3.play();
      player3.rewind();
    } else if ((keyPressed == true) && (key == '4')) {
      image(img4, faces[i].x, faces[i].y-30, faces[i].width+20, faces[i].height+10);
      player2.play();
      player2.rewind();
    } else if ((keyPressed == true) && (key == '5')) {
      image(img5, faces[i].x-10, faces[i].y-10, faces[i].width+40, faces[i].height+100);
      player8.play();
      player8.rewind();
    } else if ((keyPressed == true) && (key == '6')) {
      image(img6, faces[i].x, faces[i].y-40, faces[i].width, faces[i].height);
      player5.play();
      player5.rewind();
    } else if ((keyPressed == true) && (key == '7')) {
      image(img7, faces[i].x, faces[i].y-40, faces[i].width, faces[i].height);
      player4.play();
      player4.rewind();
    } else if ((keyPressed == true) && (key == '8')) {
      image(img8, faces[i].x, faces[i].y+10, faces[i].width, faces[i].height);
      player7.play();
      player7.rewind();
    } else {
      image(img1, faces[i].x, faces[i].y-50, faces[i].width+10, faces[i].height+10);
    }
  }
}


void mousePressed() {

  save(saveCount+".png");
  saveCount++;
  println(saveCount);

  player1.rewind();
  player1.play();
}
