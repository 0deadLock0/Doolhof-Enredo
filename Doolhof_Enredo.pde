/* DOOLHOF ENREDO
   A 2D Interactive, Multiplayer, Arcade Game
   Run using processing and Arduino
   Sensors used- Capacitive Touch and Gyroscope
   Developed for Course Mid Sem Project
   
   by-
      Rohit
      Abhish
      Abhimanyu
*/
String []GameName={"DOOLHOF","ENREDO"};

//import processing.serial.*; // Library to connect Arduino

import processing.sound.*; // Library to access sound 


// To add music to the game
SoundFile file;
SqrOsc square;

/* // Varriable required when controling using Arduino
Serial myPort1,myPort2;
String val1,valX1,valY1,val2,valX2,valY2;
int X1,Y1,X2,Y2;
int touch1=0,touch2=0;
*/

int count1=0,count2=0;
PImage img,brick1,charright1,charright2,charright3,charleft1,charleft2,charleft3,charup1,charup2,charup3,chardown1,chardown2,chardown3,char2right1,char2right2,char2right3,char2left1,char2left2,char2left3,char2up1,char2up2,char2up3,char2down1,char2down2,char2down3,enemy1,enemy2;
float a;
float x=30;float y=30;
float x2=750;float y2=750;
int walkright=7;int walkdown=7;int walkleft=7;int walkup=7;int walk=1;
int walk2right=7;int walk2down=7;int walk2left=7;int walk2up=7;int walk2=1;
String s="right",s2="d";
int r=25;
int coinbound=1;
int [][]coin1={{150,60},{320,60},{490,60},{660,60},{60,150},{60,320},{60,490},{60,660},{750,150},{750,320},{750,490},{750,660},{150,750},{320,750},{490,750},{660,750},{195,150},{285,150},{195,330},{285,330},{525,150},{615,150},{525,330},{615,330},{195,480},{285,480},{195,660},{285,660},{525,480},{615,480},{525,660},{615,660}};
int [][]coin2={{405,210},{210,405},{600,405},{405,600}};
int [][]coin3={{405,405}};
int enemyx=750,enemyy=30;
int enemy2x=390,enemy2y=90;
int newmousex=0,newmousey=0;
String setbutton="quit";
int s1=second();
int m1=minute();
int h1=hour();
int reduce=s1;
int score=0,score2=0;
String pl1="1",pl2="2";
float timecount=0;
String choice="0";
String level="easy";
String edir="left",edir2="down";
int c=0;
int stop=0;
int another=0;
int h=0;

void setup(){
  
 /* // Establishing link between Arduino and Processing
    String portName1 = Serial.list()[0];
    String portName2 = Serial.list()[1];
    myPort1 = new Serial(this, portName1, 9600);
    myPort2 = new Serial(this, portName2, 9600);
  */
  
  // To play music
  file=new SoundFile (this,"bensound-endlessmotion.mp3");
  file.play();
  
  size(1100,810,P2D);
  img=loadImage("E:/Doolhof_Enredo/mazebase.png");
  brick1=loadImage("E:/Doolhof_Enredo/brick1.png");
  charright1=loadImage("E:/Doolhof_Enredo/sprites/charright1.png");
  charright2=loadImage("E:/Doolhof_Enredo/sprites/charright2.png");
  charright3=loadImage("E:/Doolhof_Enredo/sprites/charright3.png");
  charleft1=loadImage("E:/Doolhof_Enredo/sprites/charleft1.png");
  charleft2=loadImage("E:/Doolhof_Enredo/sprites/charleft2.png");
  charleft3=loadImage("E:/Doolhof_Enredo/sprites/charleft3.png");
  charup1=loadImage("E:/Doolhof_Enredo/sprites/charup1.png");
  charup2=loadImage("E:/Doolhof_Enredo/sprites/charup2.png");
  charup3=loadImage("E:/Doolhof_Enredo/sprites/charup3.png");
  chardown1=loadImage("E:/Doolhof_Enredo/sprites/chardown1.png");
  chardown2=loadImage("E:/Doolhof_Enredo/sprites/chardown2.png");
  chardown3=loadImage("E:/Doolhof_Enredo/sprites/chardown3.png");
  char2right1=loadImage("E:/Doolhof_Enredo/sprites/char2right1.png");
  char2right2=loadImage("E:/Doolhof_Enredo/sprites/char2right2.png");
  char2right3=loadImage("E:/Doolhof_Enredo/sprites/char2right3.png");
  char2left1=loadImage("E:/Doolhof_Enredo/sprites/char2left1.png");
  char2left2=loadImage("E:/Doolhof_Enredo/sprites/char2left2.png");
  char2left3=loadImage("E:/Doolhof_Enredo/sprites/char2left3.png");
  char2up1=loadImage("E:/Doolhof_Enredo/sprites/char2up1.png");
  char2up2=loadImage("E:/Doolhof_Enredo/sprites/char2up2.png");
  char2up3=loadImage("E:/Doolhof_Enredo/sprites/char2up3.png");
  char2down1=loadImage("E:/Doolhof_Enredo/sprites/char2down1.png");
  char2down2=loadImage("E:/Doolhof_Enredo/sprites/char2down2.png");
  char2down3=loadImage("E:/Doolhof_Enredo/sprites/char2down3.png");
  enemy1=loadImage("E:/Doolhof_Enredo/enemy2.png");
  enemy2=loadImage("E:/Doolhof_Enredo/enemy2.png");
  int chance=(int) random(0,3.9);
  int chance2=(int) random(0,3.9);
  if (chance==0){
    x=random(30,750);
    y=30;
  }
  else if (chance==1){
    x=750;
    y=random(30,750);
  }
  else if (chance==2){
    x=random(30,750);
    y=750;
  }
  else if (chance==3){
    x=30;
    y=random(30,750);
  }
  if (chance2==0){
    x2=random(30,750);
    y2=30;
  }
  else if (chance2==1){
    x2=750;
    y2=random(30,750);
  }
  else if (chance2==2){
    x2=random(30,750);
    y2=750;
  }
  else{
    x2=30;
    y2=random(30,750);
  }
  
}

void brickquad(float a,float b){
  for (int i=0;i<4;i=i+1){
    image(brick1,a+i*30,b);
  }
  for (int i=0;i<4;i=i+1){
    image(brick1,a+i*30,b+30);
  }
  for (int i=0;i<4;i=i+1){
    image(brick1,a+i*30,b+60);
  }
  for (int i=0;i<4;i=i+1){
    image(brick1,a+i*30,b+90);
  }
}

void chardraw(String direc,int n,float x,float y){
  if (direc=="up"){
    if (n==1){
      image(charup1,x,y);
    }
    else if (n==2){
      image(charup2,x,y);
    }
    else if (n==3){
      image(charup3,x,y);
    }
  }
  else if (direc=="right"){
    if (n==1){
      image(charright1,x,y);
    }
    else if (n==2){
      image(charright2,x,y);
    }
    else if (n==3){
      image(charright3,x,y);
    }
  }
  else if (direc=="down"){
    if (n==1){
      image(chardown1,x,y);
    }
    else if (n==2){
      image(chardown2,x,y);
    }
    else if (n==3){
      image(chardown3,x,y);
    }
  }
  else if (direc=="left"){
    if (n==1){
      image(charleft1,x,y);
    }
    else if (n==2){
      image(charleft2,x,y);
    }
    else if (n==3){
      image(charleft3,x,y);
    }
  }
  if (direc=="d"){
    if (n==1){
      image(char2right1,x,y);
    }
    else if (n==2){
      image(char2right2,x,y);
    }
    else if (n==3){
      image(char2right3,x,y);
    }
  }
   else if (direc=="s"){
     if (n==1){
       image(char2down1,x,y);
     }
     else if (n==2){
       image(char2down2,x,y);
     }
     else if (n==3){
       image(char2down3,x,y);
     }
   }
   else if (direc=="a"){
     if (n==1){
       image(char2left1,x,y);
     }
     else if (n==2){
       image(char2left2,x,y);
     }
     else if (n==3){
       image(char2left3,x,y);
     }
   }
   else if (direc=="w"){
     if (n==1){
       image(char2up1,x,y);
     }
     else if (n==2){
       image(char2up2,x,y);
     }
     else if (n==3){
       image(char2up3,x,y);
     }
   }
}
/*void getDirection() // Getting Directions using Arduino
{
   if ( myPort1.available() > 0) 
    val1 = myPort1.readStringUntil('\n');
   if(val1!=null)
    { 
      valX1=val1.substring(0,val1.indexOf("."));
      valY1=val1.substring(val1.indexOf(":")+1,val1.indexOf(".",val1.indexOf(".")+1));
      X1=int(valX1);
      Y1=int(valY1);
      touch1=int(val1.substring(val1.indexOf(":",val1.indexOf(":")+1)+1,val1.indexOf(":",val1.indexOf(":")+1)+2));
    }
     if(Y1>9 && Y1<81)
       s="down";//Direction is "Down"
      else if(Y1>279 && Y1<351)
       s="up";//Direction is "Up"
      else if(X1>9 && X1<81)
       s="right";//Direction is "Right"
      else if(X1>279 && X1<351)
       s="left";//Direction is "Left"
  
   if ( myPort2.available() > 0) 
    val2 = myPort2.readStringUntil('\n');
   if(val2!=null)
    { 
      valX2=val2.substring(0,val2.indexOf("."));
      valY2=val2.substring(val2.indexOf(":")+1,val2.indexOf(".",val2.indexOf(".")+1));
      X2=int(valX2);
      Y2=int(valY2);
      touch2=int(val2.substring(val2.indexOf(":",val2.indexOf(":")+1)+1,val2.indexOf(":",val2.indexOf(":")+1)+2));
     
    }
      if(X2>9 && X2<81)
       s2="d";//Direction is "Right"
      else if(X2>279 && X2<351)
       s2="a";//Direction is "Left"
      else if(Y2>9 && Y2<81)
       s2="s";//Direction is "Down"
      else if(Y2>279 && Y2<351)
       s2="w";//Direction is "Up"
     
}
*/
boolean collision(float x,float y){
  int v=0;
  int [][]l={{90,90,240,30},{90,90,30,240},{480,90,240,30},{690,90,30,240},{90,480,30,240},{90,690,240,30},{480,690,240,30},{690,480,30,240},{360,120,30,240},{420,90,30,270},{450,360,240,30},{450,420,270,30},{420,450,30,240},
            {360,450,30,270},{120,420,240,30},{90,360,270,30},{180,180,120,120},{510,180,120,120},{180,510,120,120},{510,510,120,120}};
  for (int i=0;i<20;i=i+1){
    if ((x<=l[i][0]+l[i][2] && x>=l[i][0]) && (y<=l[i][1]+l[i][3] && y>=l[i][1])){
      v=1;
      break;
    }
   }
  if (v==1){
    return false;
  }
  else{
    return true;
  }
}

boolean enemycollide(float x,float y){
  if ((x<=enemyx+30 && x>=enemyx && y<=enemyy+30 && y>=enemyy) && (level=="hard") || ((x<=enemy2x+30 && x>=enemy2x && y<=enemy2y+30 && y>=enemy2y) && (level=="hard") && (another==1))){
    return true;
  }
  else{
    return false;
  }
}

void updateenemy(){
  if (enemyx==750 && enemyy<=30){
    edir="left";
  }
  if (enemyx<=30 && enemyy==30){
    edir="down";
  }
  if (enemyx==30 && enemyy>=750){
    edir="right";
  }
  if (enemyx>=750 && enemyy==750){
    edir="up";
  }
  if (edir=="left"){
    enemyx=enemyx-2;
  }
  if (edir=="down"){
    enemyy=enemyy+2;
  }
  if (edir=="right"){
    enemyx=enemyx+2;
  }
  if (edir=="up"){
    enemyy=enemyy-2;
  }
} 

void updateenemy2(){
  if (enemy2x==390 && enemy2y<=90){
    edir2="down";
  }
  if (enemy2x==390 && enemy2y>=690){
    edir2="up";
  }
  if (edir2=="down"){
    enemy2y=enemy2y+2;
  }
  if (edir2=="up"){
    enemy2y=enemy2y-2;
  }
}

void drawenemy(){
  image(enemy1,enemyx,enemyy);
}

void drawenemy2(){
  image(enemy2,enemy2x,enemy2y);
}
  

void drawcoin(String s,float x,float y){
  
  if (r==25){
    coinbound=1;
    }
    if (r==10){
      coinbound=0;
    }
    if (coinbound==1){
      r=r-1;
    }
    if (coinbound==0){
      r=r+1;
    }
  for (int i=0;i<32;i=i+1){
    if (((x<=coin1[i][0]+25 && x>=coin1[i][0]-20) && (y<=coin1[i][1]+25 && y>=coin1[i][1]-20)) | ((x+16<=coin1[i][0]+25 && x+16>=coin1[i][0]-20) && (y<=coin1[i][1]+25 && y>=coin1[i][1]-20)) | ((x+16<=coin1[i][0]+25 && x+16>=coin1[i][0]-20) && (y+25<=coin1[i][1]+25 && y+25>=coin1[i][1]-20)) | ((x<=coin1[i][0]+25 && x>=coin1[i][0]-20) && (y+25<=coin1[i][1]+25 && y+25>=coin1[i][1]-20)) ){
      coin1[i][0]=900;
      coin1[i][1]=900;
      if (s=="1"){
        score=score+1;
      }
      else if (s=="2"){
        score2=score2+1;
      }
    }
    fill(255,255,0);
    ellipse(coin1[i][0],coin1[i][1],r,25);
    fill(200,200,0);
    ellipse(coin1[i][0],coin1[i][1],r-7,18);
  }

  for (int i=0;i<4;i=i+1){
    if (((x<=coin2[i][0]+25 && x>=coin2[i][0]-20) && (y<=coin2[i][1]+25 && y>=coin2[i][1]-20)) | ((x+16<=coin2[i][0]+25 && x+16>=coin2[i][0]-20) && (y<=coin2[i][1]+25 && y>=coin2[i][1]-20)) | ((x+16<=coin2[i][0]+25 && x+16>=coin2[i][0]-20) && (y+25<=coin2[i][1]+25 && y+25>=coin2[i][1]-20)) | ((x<=coin2[i][0]+25 && x>=coin2[i][0]-20) && (y+25<=coin2[i][1]+25 && y+25>=coin2[i][1]-20)) ){
      coin2[i][0]=900;
      coin2[i][1]=900;
      if (s=="1"){
        score=score+2;
      }
      else if (s=="2"){
        score2=score2+2;
      }
    }
    fill(255,165,0);
    ellipse(coin2[i][0],coin2[i][1],r,25);
    fill(200,135,0);
    ellipse(coin2[i][0],coin2[i][1],r-7,18);
  }
  for (int i=0;i<1;i=i+1){
    if (((x<=coin3[i][0]+25 && x>=coin3[i][0]-20) && (y<=coin3[i][1]+25 && y>=coin3[i][1]-20)) | ((x+16<=coin3[i][0]+25 && x+16>=coin3[i][0]-20) && (y<=coin3[i][1]+25 && y>=coin3[i][1]-20)) | ((x+16<=coin3[i][0]+25 && x+16>=coin3[i][0]-20) && (y+25<=coin3[i][1]+25 && y+25>=coin3[i][1]-20)) | ((x<=coin3[i][0]+25 && x>=coin3[i][0]-20) && (y+25<=coin3[i][1]+25 && y+25>=coin3[i][1]-20)) ){
      coin3[i][0]=900;
      coin3[i][1]=900;
      if (s=="1"){
        score=score+5;
      }
      else if (s=="2"){
        score2=score2+5;
      }
    }
    fill(0,150,255);
    ellipse(coin3[i][0],coin3[i][1],r,25);
    fill(255,0,0);
    ellipse(coin3[i][0],coin3[i][1],r-7,18);
  }
}

void update(String s){
  if (s=="up"){
    if (y-2>=30){
      if (collision(x,y-2) && collision(x+16,y-2)){
        y=y-2;
        walkup=walkup+1;
        if (walkup>27){
          walkup=7;
        }
         s="up";
         walk=walkup/7;
      }
     }
    }
   else if (s=="right"){
     if (x+2<=760){
       if (collision(x+2+16,y+22) && collision(x+2+16,y)){
        x=x+2;
        walkright=walkright+1;
        if (walkright>27){
          walkright=7;
        }
        s="right";
        walk=walkright/7;
       }
     }
    }
   else if (s=="down"){
     if (y+2<=755){
       if (collision(x,y+2+22) && collision(x+16,y+2+22)){
        y=y+2;
        walkdown=walkdown+1;
        if (walkdown>27){
          walkdown=7;
        }
        s="down";
        walk=walkdown/7;
       }
     }
    }
   else if (s=="left"){
     if (x-2>=30){
       if (collision(x-2,y) && collision(x-2,y+22)){
        x=x-2;
        walkleft=walkleft+1;
        if (walkleft>27){
          walkleft=7;
        }
         s="left";
         walk=walkleft/7;
       }
     }
    }
    if (s=="w"){
    if (y2-2>=30){
      if (collision(x2,y2-2) && collision(x2+16,y2-2)){
        y2=y2-2;
        walk2up=walk2up+1;
        if (walk2up>27){
          walk2up=7;
        }
         s="w";
         walk2=walk2up/7;
      }
     }
    }
   else if (s=="d"){
     if (x2+2<=760){
       if (collision(x2+2+16,y2+22) && collision(x2+2+16,y2)){
        x2=x2+2;
        walk2right=walk2right+1;
        if (walk2right>27){
          walk2right=7;
        }
        s="d";
        walk2=walk2right/7;
       }
     }
    }
   else if (s=="s"){
     if (y2+2<=755){
       if (collision(x2,y2+2+22) && collision(x2+16,y2+2+22)){
        y2=y2+2;
        walk2down=walk2down+1;
        if (walk2down>27){
          walk2down=7;
        }
        s="s";
        walk2=walk2down/7;
       }
     }
    }
   else if (s=="a"){
     if (x2-2>=30){
       if (collision(x2-2,y2) && collision(x2-2,y2+22)){
        x2=x2-2;
        walk2left=walk2left+1;
        if (walk2left>27){
          walk2left=7;
        }
         s="a";
         walk2=walk2left/7;
       }
     }
    }
}


void drawhelp(){
  fill(0,0,0);
  rect(840,160,230,243);
}

void keyPressed(){
  if (key==CODED){
    if (keyCode==UP){
       s="up";
    }
    else if (keyCode==RIGHT){
      s="right";
    }
    else if (keyCode==DOWN){
      s="down";
    }
   else if (keyCode==LEFT){
       s="left";
    }
    count1=count1+1;
  }
  else {
    if (key=='w' || key=='W'){
      s2="w";
    }
    else if (key=='d' || key=='D'){
      s2="d";
    }
    else if (key=='s' || key=='S'){
      s2="s";
    }
    else if (key=='a' || key=='A'){
      s2="a";
    }
    count2=count2+1;
  }
    
}
void mousePressed(){
  if (mouseButton == LEFT){
    newmousex=mouseX;
    newmousey=mouseY;
  }
}

void helpbutton(String s,int x,int y){
  fill(0,0,0);
  rect(x,y,32*s.length(),50);
  fill(0,102,153);
  text(s,x+5,y+43);
  if ((newmousex<=x+32*s.length()) && (newmousex>=x) && (newmousey<=y+50) && (newmousey>=y)){
    setbutton="help";
    fill(0,0,0);
    rect(810,160,290,650);
    textSize(20);
    fill(0,102,153);
    text("Tilt controller to select",830,210);
    text("direction",830,230);
    text("Press button to move",830,270);
    text("in that direction",830,290);
    text("The one with more",830,330);
    text("points at end, will win",830,350);
    text("Avoid enemies on the",830,390);
    text("way or you will lose",830,410);
    text("Yellow coins- 1 point",830,450);
    text("Orange coins- 2 point",830,490);
    text("Red coin- 5 points",830,530);
  }
  else{
    setbutton="quit";
  }
}


void quitbutton(String s,int x,int y){
  fill(0,0,0);
  rect(x,y,32*s.length(),50);
  fill(0,102,153);
  textSize(45);
  text(s,x+5,y+43);
  if ((newmousex<=x+32*s.length()) && (newmousex>=x) && (newmousey<=y+50) && (newmousey>=y)){
    if (setbutton=="quit"){
      if (s=="QUIT"){
        exit();
      }
    }
  }
}

void drawtime(float timecount){
  fill(0,0,0);
  rect(810,380,290,50);
  fill(0,102,153);
  textSize(30);
  text("Time:",880,420);
  text(str((int) timecount/60),1000,420);
}

void drawscore(){
  fill(0,0,0);
  rect(810,430,290,380);
  stroke(150);
  line(955,430,955,810);
  textSize(30);
  fill(0,102,153);
  text("Player 1:",820,460);
  text("Player 2:",965,460);
  image(chardown2,874,480);
  image(char2down2,1019,480);
  text(str(score),874,535);
  text(str(score2),1019,535);
}

void drawscoresingle(){
  fill(0,0,0);
  rect(810,430,290,380);
  stroke(150);
  textSize(30);
  fill(0,102,153);
  text("Player 1:",892,460);
  image(chardown2,946,480);
  text(str(score),946,535);
}
  

void drawwin(String s){
  fill(0,0,0);
  rect(270,390,270,90);
  stroke(150);
  textSize(30);
  fill(0,102,153);
  text(s+" wins !",300,450);
}

void drawlose(String s){
  fill(0,0,0);
  rect(270,390,270,90);
  stroke(150);
  textSize(30);
  fill(0,102,153);
  text("You lose!",300,450);
}

void drawmenu(){
  background(255,198,26);
  fill(0,0,102);
  rect(70,20,105,765);
  rect(210,20,105,765);
  fill(0,0,153);
  rect(175,20,35,765);
  fill(204,0,0);
  textSize(110);
  for(int j=0;j<7;j++)
   text(GameName[0].charAt(j),80,110*(j+1));
  for(int j=0;j<6;j++)
   text(GameName[1].charAt(j),220,130*(j+1)-10+j);
  textSize(50);
  fill(0,0,0);
  rect(390,50,330,120);
  stroke(150);
  fill(255,0,0);
  text("Single Player",400,122);
  fill(0,0,0);
  rect(363,195,382,120);
  stroke(150);
  fill(255,0,0);
  text("Multiple Player",373,267);
  fill(0,0,0);
  rect(485,340,135,120);
  stroke(150);
  fill(255,0,0);
  text("Help",497,412);
  fill(0,0,0);
  rect(460,485,190,120);
  stroke(150);
  fill(255,0,0);
  text("Credits",465,557);
  fill(0,0,0);
  rect(485,630,135,120);
  stroke(150);
  fill(255,0,0);
  text("Quit",497,702);
  fill(0,0,0);
  rect(860,305,145,70);
  stroke(150);
  fill(0,255,0);
  text("EASY",865,355);
  fill(0,0,0);
  rect(860,385,145,70);
  stroke(150);
  fill(0,0,255);
  text("HARD",865,435);
     if(newmousex>390 && newmousex<720 && newmousey>50 && newmousey<170){
      choice="s";
      c=c+1;
     }
     else if(newmousex>363 && newmousex<745 && newmousey>195 && newmousey<315){
      choice="m";
      c=c+1;
     }
     else if(newmousex>485 && newmousex<620 && newmousey>340 && newmousey<460){
      choice="h";
      fill(0,0,0);
      rect(810,0,290,810);
      textSize(40);
      fill(0,150,0);
      text("HELP",910,100);
      textSize(20);
      fill(0,102,153);
      text("Tilt controller to select",830,210);
      text("direction",830,230);
      text("Press button to move",830,270);
      text("in that direction",830,290);
      text("The one with more",830,330);
      text("points at end, will win",830,350);
      text("Avoid enemies on the",830,390);
      text("way or you will lose",830,410);
      text("Yellow coins- 1 point",830,450);
      text("Orange coins- 2 point",830,490);
      text("Red coin- 5 points",830,530);
     }
     else if(newmousex>460 && newmousex<650 && newmousey>485 && newmousey<605){
      choice="c";
      fill(0,0,0);
      rect(810,0,290,810);
      textSize(40);
      fill(0,150,0);
      text("CREDITS",870,60);
      textSize(20);
      fill(0,102,153);
      text("Doolhof Enredo is a 2D",825,90);
      text("interactive multiplayer",825,110);
      text("arcade game, supported",825,130);
      text("by windows and ios",825,150);
      text("Developed and Maintained",825,190);
      text("by Btech(2019-2023)",825,210);
      text("First year students: ",825,230);
      text("Rohit, Abhish, Abhimanyu",825,250);
      text("at IIITD, under",825,270);
      text("the guidance of",825,290);
      text("Mr. Aman Parnami,",825,310);
      text("(Instructor-DES1xx,",825,330);
      text(" Protyping Interactive",825,350);
      text(" Systems)",825,370);
      text("Software used: ",825,410);
      text("*processing(.pde)",825,430);
      text("*Arduino(.ino)",825,450);
      text("Sensors used:",825,480);
      text("*Gyroscope",825,500);
      text("*Capacitive Touch Sensor",825,520);
      text("For more information visit:",825,560);
      text("https://youtu.be/g481971uaFo",825,580);
      text("Player 1 and 2 image:",825,620);
      text("https://myrealdomain.com",825,640);
      text("/images250_/",825,660);
      text("2d-character-sprite-2.png",825,680);
      text("Music credit:",825,720);
      text("'Endless Motion'",825,740);
      text("www.bensound.com",825,760);
     }
     else if(newmousex>485 && newmousex<620 && newmousey>630 && newmousey<750){
      choice="q";
      exit();
     }
     if(newmousex>860 && newmousex<1005 && newmousey>305 && newmousey<375){
        level="easy";
        fill(0,0,0);
        rect(860,305,145,70);
        stroke(150);
        fill(0,255,0);
        text("EASY",865,355);
        fill(0,0,0);
        rect(860,385,145,70);
        stroke(150);
        fill(0,0,255);
        text("HARD",865,435);
     }
     else if(newmousex>860 && newmousex<1005 && newmousey>385 && newmousey<530){
        level="hard";
        fill(0,0,0);
        rect(860,305,145,70);
        stroke(150);
        fill(0,0,255);
        text("EASY",865,355);
        fill(0,0,0);
        rect(860,385,145,70);
        stroke(150);
        fill(0,255,0);
        text("HARD",865,435);
     }
}

void draw(){
  if (c!=0){
    if (stop!=1){
    timecount=timecount+1;
    }
    fill(200,0,0);
    rect(810,0,290,810);
    textSize(45);
    fill(0,0,0);
    rect(820,27,235,50);
    fill(0, 102, 153);
    text("DOOLHOF",825,70);
    fill(0,102,153);
    stroke(150);
    fill(0,0,0);
    rect(900,87,190,50);
    fill(0,102,153);
    text("ENREDO",905,130);
    line(810,160,1100,160);
    line(810,360,1100,360);
    stroke(250);
    drawtime(timecount);
    if (choice=="s"){
      drawscoresingle();
    }
    else {
    drawscore();
    }
    quitbutton("QUIT",890,270);
    helpbutton("HELP",890,210);
    
    image(img,0,0);
    for (int i=0; i<800; i=i+30){
       image(brick1,0,i);
    }
    for (int i=0; i<800;i=i+30){
      image(brick1,i,0);
    }
    for (int i=0; i<800;i=i+30){
      image(brick1,780,i);
    }
    for (int i=0; i<800; i=i+30){
      image(brick1,i,780);
    }
    for (int i=1; i<9; i=i+1){
      image(brick1,360,90+i*30);
    }
    for (int i=0; i<9; i=i+1){
      image(brick1,420,90+i*30);
    }
    for (int i=0;i<9; i=i+1){
      image(brick1,90+i*30,360);
    }
    for (int i=1;i<9;i=i+1){
      image(brick1,90+i*30,420);
    }
    for (int i=0;i<9;i=i+1){
      image(brick1,360,690-i*30);
    }
    for (int i=1;i<9;i=i+1){
      image(brick1,420,690-i*30);
    }
    for (int i=1;i<9;i=i+1){
      image(brick1,690-i*30,360);
    }
    for (int i=0;i<9;i=i+1){
      image(brick1,690-i*30,420);
    }
    for (int i=0;i<8;i=i+1){
      image(brick1,90+i*30,90);
    }
    for (int i=0;i<8;i=i+1){
      image(brick1,90,90+i*30);
    }
    for (int i=0;i<8;i=i+1){
      image(brick1,480+i*30,90);
    }
    for (int i=0;i<8;i=i+1){
      image(brick1,690,90+i*30);
    }
    for (int i=0;i<8;i=i+1){
      image(brick1,90,480+i*30);
    }
    for (int i=0;i<8;i=i+1){
      image(brick1,90+i*30,690);
    }
    for (int i=0;i<8;i=i+1){
      image(brick1,480+i*30,690);
    }
    for (int i=0;i<8;i=i+1){
      image(brick1,690,480+i*30);
    }
    brickquad(180,180);
    brickquad(510,180);
    brickquad(180,510);
    brickquad(510,510);
    if (/*touch1==0 ||*/ count1==0){
    }
    else {
      if (stop!=1){
          update(s); 
      }
    }
//    getDirection(); //Getting direction using Arduino
      if (choice=="m"){
      noFill();
      stroke(0,0,255);
      ellipse(x2+9,y2+12,30,35);
      chardraw(s2,walk2,x2,y2);
    }
    noFill();
    stroke(255,0,0);
    ellipse(x+9,y+12,30,35);
    chardraw(s,walk,x,y);
    if (choice=="m"){
      if (/*touch2==0 || */ count2==0){
      }
      else{
        if (stop!=1){
        update(s2);
        }
      }
    }
    drawcoin(pl1,x,y);
      if (choice=="m"){
      drawcoin(pl2,x2,y2);
    }
    if (score+score2==45){
      if (score>score2){
        drawwin("Player1");
        stop=1;
      }
      else if (score2>score){
        drawwin("Player2");
        stop=1;
      }
    }
    else if (choice=="m"){
      if (enemycollide(x,y)){
        drawwin("Player2");
        stop=1;
      }
      else if (enemycollide(x2,y2)){
        drawwin("Player1");
        stop=1;
      }
    }
    else if (choice=="s"){
      if (enemycollide(x,y)){
        drawlose("lose");
        stop=1;
      }
    }
      
    if (score>14 || score2>14){
      another=1;
    }
     if (level=="hard"){
       drawenemy();
       if (stop!=1){
       updateenemy();
     }
       if (another==1){
         drawenemy2();
         if (stop!=1){
           updateenemy2();
         }
       }
    }
  }
 else if(c==0){
   drawmenu();
  }
}
