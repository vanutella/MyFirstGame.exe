//GameStates
int StartScreen = 1 ;
int Game = 2;
int GO = 3; //GameOver
int gameState = StartScreen;

//Punktestand
int score=0;

//Spielfeld Variablen
float feldX=15, feldY=60;
float feldW=780, feldH=500;

//Kellnerin
float kellX=feldX+10, kellY=200+(height/2);
float kellW=53, kellH=53;
float kellVX=0, kellVY=0, kellSpeed=250;

//Garnituren
float garW=70; //Garnitur Breite
float garH=250; // Garnitur Höhe


//BILDER
PImage Boden;
PImage Tisch1;
PImage Tisch2;
PImage Tisch3;
PImage Tisch4;
PImage Schatten;
PImage Bretzel;
PImage Bretzel2;
PImage Bier;
PImage Kellnerin;
PImage Mann1;
PImage Mann2;
PImage Mann3;
PImage BierSkala;
PImage Hinderniss;
PImage Start;
PImage GameOver;
PImage Cash;
PImage Background;
PImage Theke;
PImage Logo;

PFont Font;



//Sound Library improtieren
import ddf.minim.*;

//Objekt in minim erstellen
Minim minim;
AudioPlayer Hintergrundmusik;
AudioPlayer breakGlass;
AudioPlayer GMBH;


int pegel1H = -80;
int pegel2H = -80;
int pegel3H = -80;
int pegelW = 50;


int counter = 0;


void setup() {

size(980,580);
Boden=loadImage("floorTexture.png");
Tisch1=loadImage("table1.png");
Tisch2=loadImage("table2.png");
Tisch3=loadImage("table3.png");
Tisch4=loadImage("table4.png");
Schatten=loadImage("tableShadow.png");
Bretzel=loadImage("Bretzel.png");
Bretzel2=loadImage("Bretzel2.png");
Bier=loadImage("bier.png");
Kellnerin=loadImage("kellnerin.png");
Mann1=loadImage("mann1.png");
Mann2=loadImage("mann2.png");
Mann3=loadImage("mann3.png");
BierSkala=loadImage("bierSkala.png");
Hinderniss=loadImage("Hinderniss.png");
Start=loadImage("startBildschirm.png");
Cash=loadImage("cash.png");
Background=loadImage("background.png");
Theke=loadImage("Tresen.png");
GameOver=loadImage("gameOver.png");
Logo=loadImage("logo.png");

Font = createFont ("Symtext.ttf", 25);

//Musik erstellen
minim = new Minim (this);
//Hintergrundmusik aus data-Ordner laden
Hintergrundmusik = minim.loadFile ("Bayrisches lied.mp3");
breakGlass = minim.loadFile ("glassBreak.mp3");
GMBH = minim.loadFile ("GMBH.mp3");
}

void draw() {
  if (gameState == StartScreen){
    Hintergrundmusik.pause();
    GMBH.play();
    image(Start, 0, 0);
    textAlign(CENTER);
    textFont(Font);
    text("Press ENTER to Start Game", width/2, 40);
  }
 else if (gameState == Game) {
 
 GMBH.pause();

//Hintergrundmusik abspielen
Hintergrundmusik.play();


 background (0);
 
//Spielfeld
  
  fill(#cc9900);
  rect(15, 60, 780, 500); // Laufbereich
  image(Background, 0, 0);
  image(Boden,15,60); //Boden
  
  image(Logo,10,0);

//Garnituren
  fill(#88e3dd);
  imageMode(CORNER);
  image(Schatten, 110, 140); //Schatten
  image(Tisch4, 120, 150); //Tisch 1
  image(Bretzel, 140, 180); // Brezel Deko
  image(Bier, 165, 330); //Bier Deko
  image(Schatten, 270, 280); //Schatten
  image(Tisch3, 280, 290); //Tisch 2
  image(Bretzel, 305,420); // Brezel Deko
  image(Bretzel2, 290, 330); //Brezel Deko
  image(Bier, 320, 345); //Bier
  image(Schatten, 430, 60); //Schatten
  image(Tisch4, 440, 70); //Tisch 3
  image(Bier, 465, 90); //Bier
  image(Bier, 480, 225); //Bier
  image(Bretzel, 460, 240); //Bretzel Deko
  image(Schatten, 590, 240); //Schatten
  image(Tisch2, 600, 250); //Tisch 4
  image(Bier, 620, 300); //Bier Deko
  image(Bretzel, 635, 450); //Bretzel Deko
  
//Hinderniss
  image(Hinderniss, 290, 90);
  
//Theke
    image(Theke, 15, height/2-80);

//Männertische
    image(Mann1, 750, 100);
    image(Mann2, 750, 250);
    image(Mann3, 750, 410);

  

//Kellnerin bewegt sich
kellX=kellX+kellVX/frameRate;
kellY=kellY+kellVY/frameRate;

// Kellnerin bleibt im Spielfeld
  //oben
   if (kellY<feldY) {
     kellY = feldY;
     kellVY = 0;}
   
  //unten
     else if (kellY+kellH>feldY+feldH) {
     kellY=feldY+feldH-kellH;
     kellVY = 0;}
     
  //links
  else if (kellX<feldX) {
    kellX = feldX;
    kellVX= 0;}
    
 //rechts
  else if (kellX>feldX+feldW-kellW) {
    kellX = feldX+feldW-kellW;
    kellVX= 0;}
    
//Kellnerin läuft nicht in die Tische, bzw. wird zurück an Theke gesetzt

//Tisch1
if (kellX>120-kellW && kellX<120+garW && kellY<150+garH && kellY>150-kellH) {
kellX=feldX+10;
kellY=(height/2);}

//Tisch2
if (kellX>280-kellW && kellX<280+garW && kellY<290+garH && kellY>290-kellH) {
kellX=feldX+10;
kellY=(height/2);}

//Tisch3
if (kellX>440-kellW && kellX<440+garW && kellY<70+garH && kellY>70-kellH) {
kellX=feldX+10;
kellY=(height/2);}

//Tisch4
if (kellX>600-kellW && kellX<600+garW && kellY<250+garH && kellY>250-kellH) {
kellX=feldX+10;
kellY=(height/2);}

//Kellnerin Männertisch Stop
 
 //Männertisch 1
 if (kellX>=730 && kellY<=110+70 && kellY>=110-kellH){
   kellX=feldX+10;
   kellY=(height/2);
   score = score + 10;
   pegel1H= -80;
 }
 
 //Männertisch 2
 if (kellX>=730 && kellY<=270+70 && kellY>=270-kellH){
   kellX=feldX+10;
   kellY=(height/2);
   score = score + 10;
   pegel2H= -80;
 }
  //Männertisch 3
 if (kellX>=730 && kellY<=430+70 && kellY>=430-kellH){
   kellX=feldX+10;
   kellY=(height/2);
   score = score + 10;
   pegel3H=-80;
 }
 
//Kellnerin Hindernis Stop
  if(kellX<290+90 && kellX>290-kellW && kellY>40 && kellY<90+60 ){
  kellX=feldX+10;
  kellY=(height/2);
  }

//Kellnerin 
image(Kellnerin, kellX, kellY);

//Score
fill(0,255,255);
image(Cash, 705, 10);
fill(255);
text("=" + score,800,35);


//Pegel sinken
//Pegel 1
counter++;
fill(#F7C933);
rect(880, 190, pegelW, pegel1H);
image(BierSkala, 880, 97);
if(counter % 170 == 0){
  if( pegel1H < 0){
  pegel1H += 5;
  }
}
//Pegel 2
fill(#F7C933);
rect(880, 340, pegelW, pegel2H);
image(BierSkala, 880,247);
if(counter % 150 == 0){
  if( pegel2H < 0){
  pegel2H += 5;
  }
}

//Pegel 3
fill(#F7C933);
stroke(0);
strokeWeight(1);
rect(880, 500, pegelW, pegel3H);
image(BierSkala, 880, 407);
if(counter % 200 == 0){
  if( pegel3H < 0){
  pegel3H += 5;
  }
}
if(pegel1H == 0 || pegel2H == 0 || pegel3H  == 0){
 gameState=GO;
}
}
else if (gameState == GO){                //Game Over Screen
     //Bierpegel wieder auf voll setzten, damit Spiel von vorne losgehen kann
    pegel1H=-80;
    pegel2H=-80;
    pegel3H=-80;
    
    fill(255);
    image(GameOver,0,0);
    textSize(30);
    textFont(Font);
    textAlign(CENTER);
    text("ENTER um neu zu starten", width/2, 70);
    

}

}


void keyPressed() {
//Kellnersteuerung mit Pfeilstasten
  if (keyCode==UP) {
    kellVY = -kellSpeed;
  }
  else if (keyCode==DOWN) {
    kellVY = +kellSpeed;
  }
  else if (keyCode==LEFT){
    kellVX = -kellSpeed;
  }
  else if (keyCode==RIGHT){
    kellVX = +kellSpeed;
  }

  if (key==ENTER){
    if (gameState == StartScreen){
      gameState = Game;}
      else if (gameState==GO){
        gameState = StartScreen;}
  }
}

void keyReleased(){
//Kellnerin bleibt stehen, wenn Pfeiltasten losgelassen werden
  kellVY=0 ;
  kellVX=0;
}