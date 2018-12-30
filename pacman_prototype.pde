float S = 225;
float E = 495;
float x = 360;
float y = 235;
float dia;
float [] x_monster = new float [4];
float [] y_monster = new float [4];
String [] d_monster = new String [4]; //direction
String direction = "LEFT";
String new_direction = "LEFT";
color[] enemy_color = new color[4];
color rect_color = color(255);
color rect_color2 = color(255);
color izike_color = color(0, 0, 255); //izike(blue)
String state = "menu";
PFont font;
float speed = -5;
String monster_state = "";
float monster_size;
float monster_speed = 2;
PImage title;
int stage = 1;
float framerate = 40;
int stcount;

int num_dots = 0;
int num_dots_org = 0;

int[][] maze = {{3, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 8, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 4}, //1
  {0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0}, //2
  {0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0}, //3
  {0, 2, 0, 0, 19, 23, 20, 0, 0, 19, 23, 23, 20, 0, 0, 2, 0, 0, 19, 23, 23, 20, 0, 0, 19, 23, 20, 0, 0, 2, 0}, //4
  {0, 2, 0, 0, 21, 23, 22, 0, 0, 21, 23, 23, 22, 0, 0, 2, 0, 0, 21, 23, 23, 22, 0, 0, 21, 23, 22, 0, 0, 2, 0}, //5
  {0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0}, //6
  {0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0}, //7
  {0, 2, 0, 0, 14, 1, 13, 0, 0, 2, 0, 0, 14, 1, 1, 8, 1, 1, 13, 0, 0, 2, 0, 0, 14, 1, 13, 0, 0, 2, 0}, //8
  {0, 2, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 2, 0}, //9
  {0, 2, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 2, 0}, //10
  {0, 5, 1, 1, 1, 1, 4, 0, 0, 10, 1, 1, 13, 0, 0, 12, 0, 0, 13, 1, 1, 9, 0, 0, 3, 1, 1, 1, 1, 6, 0}, //11
  {0, 0, 0, 0, 0, 0, 2, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 2, 0, 0, 0, 0, 0, 0}, //12
  {0, 0, 0, 0, 0, 0, 2, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 2, 0, 0, 0, 0, 0, 0}, //13
  {0, 0, 0, 0, 0, 0, 2, 0, 0, 2, 0, 0, 15, 1, 25, 25, 25, 1, 16, 0, 0, 2, 0, 0, 2, 0, 0, 0, 0, 0, 0}, //14
  {1, 1, 1, 1, 1, 1, 6, 0, 0, 12, 0, 0, 2, 0, 0, 0, 0, 0, 2, 0, 0, 12, 0, 0, 5, 1, 1, 1, 1, 1, 1, 0}, //15
  {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}, //16
  {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}, //17
  {1, 1, 1, 1, 1, 1, 4, 0, 0, 11, 0, 0, 2, 0, 0, 0, 0, 0, 2, 0, 0, 11, 0, 0, 3, 1, 1, 1, 1, 1, 1, 0}, //18
  {0, 0, 0, 0, 0, 0, 2, 0, 0, 2, 0, 0, 17, 1, 1, 1, 1, 1, 18, 0, 0, 2, 0, 0, 2, 0, 0, 0, 0, 0, 0}, //19
  {0, 0, 0, 0, 0, 0, 2, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 2, 0, 0, 0, 0, 0, 0}, //20
  {0, 0, 0, 0, 0, 0, 2, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 2, 0, 0, 0, 0, 0, 0}, //21
  {0, 3, 1, 1, 1, 1, 6, 0, 0, 12, 0, 0, 14, 1, 1, 8, 1, 1, 13, 0, 0, 12, 0, 0, 5, 1, 1, 1, 1, 4, 0}, //22
  {0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0}, //23
  {0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0}, //24
  {0, 2, 0, 0, 14, 1, 20, 0, 0, 14, 1, 1, 13, 0, 0, 2, 0, 0, 14, 1, 1, 13, 0, 0, 19, 1, 13, 0, 0, 2, 0}, //25
  {0, 2, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 2, 0}, //26
  {0, 2, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 2, 0}, //27
  {0, 10, 1, 13, 0, 0, 12, 0, 0, 11, 0, 0, 14, 1, 1, 8, 1, 1, 13, 0, 0, 11, 0, 0, 12, 0, 0, 14, 1, 9, 0}, //28
  {0, 2, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 2, 0}, //29
  {0, 2, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 2, 0}, //30
  {0, 2, 0, 0, 14, 1, 1, 1, 1, 7, 1, 1, 13, 0, 0, 12, 0, 0, 14, 1, 1, 7, 1, 1, 1, 1, 13, 0, 0, 2, 0}, //31
  {0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0}, //32
  {0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0}, //33
  {0, 5, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 6, 0}}; //34
//{0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0}, //35
//{0, 5, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 6, 0}};//36

int [][]dots_org = {{1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1}, //1
  {1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1}, //2
  {2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 2}, //3
  {1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1}, //4
  {1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1}, //5
  {1, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 1}, //6
  {1, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 1}, //7
  {1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 1, 1}, //8
  {0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0}, //9
  {0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0}, //10
  {0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0}, //11
  {0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0}, //12
  {0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0}, //13
  {0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0}, //14
  {0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0}, //15
  {0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0}, //16
  {0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0}, //17
  {0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0}, //18
  {0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0}, //19
  {0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0}, //20
  {0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0}, //21
  {1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1}, //22
  {1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1}, //23
  {1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1}, //24
  {2, 1, 1, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 2}, //25
  {0, 0, 1, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 1, 0, 0}, //26
  {0, 0, 1, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 1, 0, 0}, //27
  {1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 1, 1}, //28
  {1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1}, //29
  {1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1}, //30
  {1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1}};//31

int[][] dots = new int[31][26];

String[] directions = {"UP", "DOWN", "LEFT", "RIGHT"};

void setup() {
  size(523, 756);
  title = loadImage("pacman.jpg");

  // count dots
  for (int i = 0; i < dots_org.length; i++) {
    for (int j = 0; j < dots_org[0].length; j++) {
      if (dots_org[i][j] > 0) {
        num_dots_org++;
      }
    }
  }
  num_dots = num_dots_org;

  //monster's location

  for (int i = 1; i < 4; i++) {
    x_monster[i] = 260;
    y_monster[i] = 270;
  }
  x_monster[0] = width;
  y_monster[0] = 250 - 35;
  d_monster[0] = "LEFT";

  fill(200, 200, 0);
  textSize(100);
  enemy_color[0] = color(255, 0, 0); //red
  enemy_color[1] = color(250, 250, 50); // orange
  enemy_color[2] = color(0, 255, 255); // light blue
  enemy_color[3] = color(#FF52CE); // pink

  /* @pjs font="font.TTF"; */
  font = createFont("font.TTF", 32);
  textFont(font);
}

void draw() {
  background(0);

  //menu

  if (state == "menu") {
    ellipseMode(CENTER);
    textSize(100);
    image(title, 40, 70, 450, 100); 

    monster_size = 4;
    Shadow(x_monster[0], y_monster[0] - 15, d_monster[0], enemy_color[0], monster_state, monster_size);

    fill(200, 200, 0);
    noStroke();
    dia = 65;
    arc(x, y, dia, dia, radians(S), radians(E)); //draw pacman

    x += speed;
    x_monster[0] += speed;

    if (x_monster[0] < -180) {
      monster_state = "izike";
      speed = -speed;
      //d_monster[0] = "RIGHT";
      S = 45;
      E = 315;
    }

    if (x_monster[0] > width+200) {
      monster_state = "";
      speed = -speed;
      d_monster[0] = "LEFT";
      S = 225;
      E = 495;
    }
    monster_size = 4;
    arc(180, 355, 65, 65, radians(45), radians(315)); //draw pacman
    Shadow(180 - 35, 420, "RIGHT", enemy_color[0], "", monster_size);
    fill(200, 200, 0);
    textSize(50);
    text("Play", 230, 370);
    fill(255, 0, 0);
    text("shop", 230, 470);
    Shadow(140 - 35, 520, "RIGHT", enemy_color[3], "", monster_size);
    fill(#FF52CE);
    text("setting", 190, 570);
    if (210 < mouseX && 210 + 155 > mouseX && 330 < mouseY && 330 + 50 > mouseY) {
      if (mousePressed) {
        state = "play";
        monster_state = "";
        x = 240;
        y = 90;
        x_monster[0] = 260;
        y_monster[0] = 270;
        direction = "RIGHT";
        dia = height / 42 * 2;
        frameRate(framerate);

        // copy dots array
        for (int i = 0; i < dots_org.length; i++) {
          for (int j = 0; j < dots_org[0].length; j++) {
            dots[i][j] = dots_org[i][j];
          }
        }
      }
    }
    if (210 < mouseX && 210 + 165 > mouseX && 430 < mouseY && 430 + 50 > mouseY) {
      if (mousePressed) {
        state = "shop";
        monster_state = "";
      }
    }

    if (170 < mouseX && 170 + 250 > mouseX && 530 < mouseY && 530 + 50 > mouseY) {
      if (mousePressed) {
        state = "setting";
        monster_state = "";
      }
    }
  }
  if (state == "setting") {
  }
  if (state == "shop") {
    fill(200, 200, 0);
    textSize(100);
    text("shop", 240, 100) ;
    textSize(50);
  }

  if (state == "play") {
    speed = 2;
    ellipseMode(CORNER);
    // 
    pushMatrix();
    noStroke();
    translate(0, 80);
    for (int i = 0; i < 34; i++) {
      for (int j = 1; j < 30; j++) {
        if (maze[i][j] == 0) {
          //fill(0, 0, 255);
          //rect(dia*j, dia*i, dia, dia);
        } else if (maze[i][j] == 1) {
          fill(0, 0, 255);
          rect(dia/2*(j-1), dia/2*i, dia/2, dia/2);
        } else if (maze[i][j] == 2) {
          fill(0, 0, 255);
          rect(dia/2*(j-1), dia/2*i, dia/2, dia/2);
        } else if (maze[i][j] == 3) {
          fill(0, 0, 255);
          rect(dia/2*(j-1), dia/2*i, dia/2, dia/2);
        } else if (maze[i][j] == 4) {
          fill(0, 0, 255);
          rect(dia/2*(j-1), dia/2*i, dia/2, dia/2);
        } else if (maze[i][j] == 5) {
          fill(0, 0, 255);
          rect(dia/2*(j-1), dia/2*i, dia/2, dia/2);
        } else if (maze[i][j] == 6) {
          fill(0, 0, 255);
          rect(dia/2*(j-1), dia/2*i, dia/2, dia/2);
        } else if (maze[i][j] == 7) {
          fill(0, 0, 255);
          rect(dia/2*(j-1), dia/2*i, dia/2, dia/2);
        } else if (maze[i][j] == 8) {
          fill(0, 0, 255);
          rect(dia/2*(j-1), dia/2*i, dia/2, dia/2);
        } else if (maze[i][j] == 9) {
          fill(0, 0, 255);
          rect(dia/2*(j-1), dia/2*i, dia/2, dia/2);
        } else if (maze[i][j] == 10) {
          fill(0, 0, 255);
          rect(dia/2*(j-1), dia/2*i, dia/2, dia/2);
        } else if (maze[i][j] == 11) {
          fill(0, 0, 255);
          rect(dia/2*(j-1), dia/2*i, dia/2, dia/2);
        } else if (maze[i][j] == 12) {
          fill(0, 0, 255);
          rect(dia/2*(j-1), dia/2*i, dia/2, dia/2);
        } else if (maze[i][j] == 13) {
          fill(0, 0, 255);
          rect(dia/2*(j-1), dia/2*i, dia/2, dia/2);
        } else if (maze[i][j] == 14) {
          fill(0, 0, 255);
          rect(dia/2*(j-1), dia/2*i, dia/2, dia/2);
        } else if (maze[i][j] == 15) {
          fill(0, 0, 255);
          rect(dia/2*(j-1), dia/2*i, dia/2, dia/2);
        } else if (maze[i][j] == 16) {
          fill(0, 0, 255);
          rect(dia/2*(j-1), dia/2*i, dia/2, dia/2);
        } else if (maze[i][j] == 17) {
          fill(0, 0, 255);
          rect(dia/2*(j-1), dia/2*i, dia/2, dia/2);
        } else if (maze[i][j] == 18) {
          fill(0, 0, 255);
          rect(dia/2*(j-1), dia/2*i, dia/2, dia/2);
        } else if (maze[i][j] == 19) {
          fill(0, 0, 255);
          rect(dia/2*(j-1), dia/2*i, dia/2, dia/2);
        } else if (maze[i][j] == 20) {
          fill(0, 0, 255);
          rect(dia/2*(j-1), dia/2*i, dia/2, dia/2);
        } else if (maze[i][j] == 21) {
          fill(0, 0, 255);
          rect(dia/2*(j-1), dia/2*i, dia/2, dia/2);
        } else if (maze[i][j] == 22) {
          fill(0, 0, 255);
          rect(dia/2*(j-1), dia/2*i, dia/2, dia/2);
        } else if (maze[i][j] == 23) {
          fill(0, 0, 255);
          rect(dia/2*(j-1), dia/2*i, dia/2, dia/2);
        } else if (maze[i][j] == 24) {
          fill(0, 0, 255);
          rect(dia/2*(j-1), dia/2*i, dia/2, dia/2);
        } else if (maze[i][j] == 25) {
          fill(#F7A47A); //skin color
          rect(dia/2*(j-1), dia/2*i, dia/2, dia/2);
        } else if (maze[i][j] == 26) {
          fill(0, 0, 255);
          rect(dia/2*(j-1), dia/2*i, dia/2, dia/2);
        } else if (maze[i][j] == 27) {
          fill(0, 0, 255);
          rect(dia/2*(j-1), dia/2*i, dia/2, dia/2);
        } else if (maze[i][j] == 28) {
          fill(0, 0, 255);
          rect(dia/2*(j-1), dia/2*i, dia/2, dia/2);
        } else if (maze[i][j] == 29) {
          fill(0, 0, 255);
          rect(dia/2*(j-1), dia/2*i, dia/2, dia/2);
        } else if (maze[i][j] == 30) {
          fill(0, 0, 255);
          rect(dia/2*(j-1), dia/2*i, dia/2, dia/2);
        } else if (maze[i][j] == 31) {
          fill(0, 0, 255);
          rect(dia/2*(j-1), dia/2*i, dia/2, dia/2);
        }
      }
    }  
    popMatrix();
    pushMatrix();
    translate(dia, dia+80);
    fill(255, 220, 120);
    noStroke();
    ellipseMode(CENTER);
    rectMode(CENTER);
    for (int i = 0; i < 31; i++) {
      for (int j = 0; j < 26; j++) {
        if (dots[i][j] == 1) {
          rect(dia/2*j, dia/2*i, 3, 3);
        } else if (dots[i][j] == 2) {
          ellipse(dia/2*j, dia/2*i, 15, 15);
        }
      }
    }
    ellipseMode(CORNER);
    rectMode(CORNER);
    popMatrix();

    //chase pacman

    for (int i = 0; i < 4; i++) {

      float r_monster = y_monster[i]/(dia/2);
      float c_monster = x_monster[i]/(dia/2)+1;

      //boolean moved = false; // did ghost move?

      boolean[] candidates = {false, false, false, false}; // up, down, left, right
      if (maze[floor(r_monster)][circular(floor(c_monster)+2)] == 0 && 
        maze[floor(r_monster)+1][circular(floor(c_monster)+2)] == 0 && 
        maze[ceil(r_monster)+1][circular(floor(c_monster)+2)] == 0) {
        candidates[3] = true;
      }

      if (maze[floor(r_monster)][circular(ceil(c_monster)-1)] == 0 && 
        maze[floor(r_monster)+1][circular(ceil(c_monster)-1)] == 0 && 
        maze[ceil(r_monster)+1][circular(ceil(c_monster)-1)] == 0) {
        candidates[2] = true;
      }

      if (maze[floor(r_monster)+2][circular(floor(c_monster))] == 0 && 
        maze[floor(r_monster)+2][circular(floor(c_monster)+1)] == 0 && 
        maze[floor(r_monster)+2][circular(ceil(c_monster)+1)] == 0) {
        candidates[1] = true;
      }
      if (maze[ceil(r_monster)-1][circular(floor(c_monster))] % 25 == 0 && 
        maze[ceil(r_monster)-1][circular(floor(c_monster)+1)] % 25 == 0 && 
        maze[ceil(r_monster)-1][circular(ceil(c_monster)+1)] % 25 == 0) {
        candidates[0] = true;
      }
      float diff = y - y_monster[i];
      int d;
      // use the last direction if it's in the candidates
      if (d_monster[i] == "RIGHT" && candidates[3]) {
        if (candidates[0] && candidates[1]) {
          if (diff > 0) {
            d_monster[i] = directions[1];
          }
          if (diff < 0) {
            d_monster[i] = directions[0];
          }
        }
        if (candidates[0]) {
          if (diff < 0) {
            d_monster[i] = directions[0];
          }
        }
        if (candidates[1]) {
          if (diff > 0) {
            d_monster[i] = directions[1];
            // right
          }
        }
      } else if (d_monster[i] == "LEFT" && candidates[2]) {
        if (candidates[0] && candidates[1]) {
          if (diff > 0) {
            d_monster[i] = directions[1];
          }
          if (diff < 0) {
            d_monster[i] = directions[0];
          }
        }
        if (candidates[0]) {
          if (diff < 0) {
            d_monster[i] = directions[0];
          }
        }
        if (candidates[1]) {
          if (diff > 0) {
            d_monster[i] = directions[1];
          }
        }
        // left
        diff = x - x_monster[i];
      } else if (d_monster[i] == "DOWN" && candidates[1]) {
        if (candidates[2] && candidates[3]) {
          if (diff > 0) {
            d_monster[i] = directions[3];
          }
          if (diff < 0) {
            d_monster[i] = directions[2];
          }
        }
        if (candidates[2]) {
          if (diff < 0) {
            d_monster[i] = directions[2];
          }
        }
        if (candidates[3]) {
          if (diff > 0) {
            d_monster[i] = directions[3];
          }
        }
        // down
      } else if (d_monster[i] == "UP" && candidates[0]) {
        if (candidates[2] && candidates[3]) {
          if (diff > 0) {
            d_monster[i] = directions[3];
          }
          if (diff < 0) {
            d_monster[i] = directions[2];
          }
        }
        if (candidates[2]) {
          if (diff < 0) {
            d_monster[i] = directions[2];
          }
        }
        if (candidates[3]) {
          if (diff > 0) {
            d_monster[i] = directions[3];
          }
        }
        // up
      } else {

        diff = x - x_monster[i];

        if (diff > 0 && candidates[3]) {
          d_monster[i] = "RIGHT";
          //moved = true;
        } else if (diff < 0 && candidates[2]) {
          d_monster[i] = "LEFT";
          //moved = true;
        }

        //if (moved == false) {
        diff = y - y_monster[i];

        if (diff > 0 && candidates[1]) {
          d_monster[i] = "DOWN";
          //moved = true;
        } else if (diff < 0 && candidates[0]) {
          d_monster[i] = "UP";
          //moved = true;
        }
        //}

        // determin direction at random
        d = int(random(4));
        while (!candidates[d]) {
          d = int(random(4));
        }
        d_monster[i] = directions[d];
      }

      if (d_monster[i] == "RIGHT") {
        x_monster[i] += monster_speed; // right
      } else if (d_monster[i] == "LEFT") {
        x_monster[i] -= monster_speed; // left
      } else if (d_monster[i] == "DOWN") {
        y_monster[i] += monster_speed; // down
      } else if (d_monster[i] == "UP") {
        y_monster[i] -= monster_speed; // up
      }
      //for warp
      if (x_monster[i] + dia < 0) {
        x_monster[i] = dia / 2 * (maze[0].length - 2);
      } else if (x_monster[i] > dia/2 * 31) {
        x_monster[i] = -dia;
      }
    }


    //pacman direction

    float r = y/(dia/2);  
    float c = x/(dia/2)+1;

    if (new_direction == "RIGHT") {
      if (maze[floor(r)][circular(floor(c)+2)] == 0 && 
        maze[floor(r)+1][circular(floor(c)+2)] == 0 && 
        maze[ceil(r)+1][circular(floor(c)+2)] == 0) {
        x += speed;
        S = 45;
        E = 315;
        direction = new_direction;
      }
    } else if (new_direction == "LEFT") {
      if (maze[floor(r)][circular(ceil(c)-1)] == 0 && 
        maze[floor(r)+1][circular(ceil(c)-1)] == 0 && 
        maze[ceil(r)+1][circular(ceil(c)-1)] == 0) {
        x -= speed;
        S = 225;
        E = 495;
        direction = new_direction;
      }
    } else if (new_direction == "UP") {
      if (maze[ceil(r)-1][circular(floor(c))] == 0 && 
        maze[ceil(r)-1][circular(floor(c)+1)] == 0 && 
        maze[ceil(r)-1][circular(ceil(c)+1)] == 0) {
        y -= speed;
        S = 315;
        E = 585;
        direction = new_direction;
      }
    } else if (new_direction == "DOWN") {
      if (maze[floor(r)+2][circular(floor(c))] == 0 && 
        maze[floor(r)+2][circular(floor(c)+1)] == 0 && 
        maze[floor(r)+2][circular(ceil(c)+1)] == 0) {
        y += speed;
        S = 135;
        E = 405;
        direction = new_direction;
      }
    }

    if (direction != new_direction) { // if couldn't go to the direction user wants to go...
      if (direction == "RIGHT") {
        if (maze[floor(r)][circular(floor(c)+2)] == 0 && maze[floor(r)+1][circular(floor(c)+2)] == 0 && maze[ceil(r)+1][circular(floor(c)+2)] == 0) {
          x += speed;
          S = 45;
          E = 315;
        }
      } else if (direction == "LEFT") {
        if (maze[floor(r)][circular(ceil(c)-1)] == 0 && maze[floor(r)+1][circular(ceil(c)-1)] == 0 && maze[ceil(r)+1][circular(ceil(c)-1)] == 0) {
          x -= speed;
          S = 225;
          E = 495;
        }
      } else if (direction == "UP") {
        if (maze[ceil(r)-1][floor(c)] == 0 && maze[ceil(r)-1][floor(c)+1] == 0 && maze[ceil(r)-1][ceil(c)+1] == 0) {
          y -= speed;
          S = 315;
          E = 585;
        }
      } else if (direction == "DOWN") {
        if (maze[floor(r)+2][floor(c)] == 0 && maze[floor(r)+2][floor(c)+1] == 0 && maze[floor(r)+2][ceil(c)+1] == 0) {
          y += speed;
          S = 135;
          E = 405;
        }
      }
    }

    // for warp
    if (x + dia < 0) {
      x = dia / 2 * (maze[0].length - 2);
    } else if (x > dia/2 * 29) {
      x = -dia;
    }

    int i2 = int(y/(dia/2) - 1);
    int j2 = int(x/(dia/2) - 1);
    //eat power dots
    if (i2 >= 0 && i2 < dots.length && j2 >= 0 && j2 < dots[0].length) {
      if (dots[i2][j2] > 0) {
        num_dots--;
      }
      if (dots[i2][j2] >= 2) {
        monster_state = "izike";
        stcount = millis();
      }
      dots[i2][j2] = 0;
    }

    if (monster_state != "") {
      int elapsed = millis() - stcount;
      if (elapsed >= 10000) {
        monster_state = "";
      } else if (elapsed >= 7000) {
        int rem = int(elapsed/200) % 2;
        if (rem == 0) {
          monster_state = "izike2";
        } else {
          monster_state = "izike";
        }
      }
    }

    // draw pacman
    fill(200, 200, 0);
    noStroke();
    pushMatrix();
    translate(0, 80);
    arc(x, y, dia, dia, radians(S), radians(E)); //draw pacman
    popMatrix();

    // pacman direction
    if (keyPressed) {
      if (keyCode == RIGHT) {
        new_direction = "RIGHT";
      }
      if (keyCode == LEFT) {
        new_direction = "LEFT";
      }
      if (keyCode == UP) {
        new_direction = "UP";
      }
      if (keyCode == DOWN) {
        new_direction = "DOWN";
      }
    }

    //draw monster
    monster_size = dia/14;
    for (int i = 0; i < 4; i++) {
      pushMatrix();
      translate(0, 80);
      Shadow(x_monster[i], y_monster[i], d_monster[i], enemy_color[i], monster_state, monster_size);
      popMatrix();
    }

    // catch? (eat pacman)

    for (int i = 0; i < 4; i++) {
      if (dist(x_monster[i], y_monster[i], x, y) < dia/2) {
        if (monster_state == "izike" || monster_state == "izike2") {  //eat monsters
          x_monster[i] = 260;
          y_monster[i] = 270;
        } else {
          state = "gameover";
        }
      }
    }
  }

  if (state == "gameover") {
    background(0);
    fill(rect_color);
    noStroke();
    rect(140, 315, 240, 50);
    fill(rect_color2);
    rect(90, 465, 345, 50);
    fill(200, 200, 0);
    textSize(50);
    text("Game over", 100, 200);
    fill(0, 255, 0);
    textSize(30);
    text("Replay", 200, 350);
    fill(0, 0, 255);
    text("Back to menu", 140, 500);
    if (mouseX > 140 && mouseY > 315 && mouseX < 140 + 240 && mouseY < 315 + 50) {
      rect_color = color(200, 200, 0);
    } else {
      rect_color = color(255);
    }
    if (mouseX > 90 && mouseY > 465 && mouseX < 90 + 345 && mouseY < 465 + 50) {
      rect_color2 = color(200, 200, 0);
    } else {
      rect_color2 = color(255);
    }
    if (mouseX > 140 && mouseY > 315 && mouseX < 140 + 240 && mouseY < 315 + 50) {
      if (mousePressed) {
        state = "play";
        for (int i = 0; i < 4; i++) {
          enemy_color[3] = color(#FF52CE);
          x_monster[i] = 260;
          y_monster[i] = 270;
        }
        x = 240;
        y = 90;
        S = 45;
        E = 315;
        direction = "RIGHT";
      }
    }
    if (mouseX > 90 && mouseY >465 && mouseX < 90 + 345 && mouseY < 465 + 50) {
      if (mousePressed) {
        state = "menu";
        x_monster[0] = width;
        y_monster[0] = 400 - 35;
        d_monster[0] = "LEFT";        
        x = 350;
        y = 390;
        S = 225;
        E = 495;
        speed = -5;
      }
    }
  }

  //println(num_dots);

  //next stage
  if (num_dots == 0) {
    x = 240;
    y = 90;
    for (int i = 0; i < x_monster.length; i++) {
      x_monster[i] = 260;
      y_monster[i] = 270;
    }
    num_dots = num_dots_org;
    stage++;
    framerate += 10;
    frameRate(framerate);

    // copy dots array
    for (int i = 0; i < dots_org.length; i++) {
      for (int j = 0; j < dots_org[0].length; j++) {
        dots[i][j] = dots_org[i][j];
      }
    }
  }
}

// circular
int circular(int i) {
  if (i < 0) {
    i = maze[0].length-1;
  } else if (i >= maze[0].length) {
    i = 0;
  }
  return i;
}

//draw Ghost

void Shadow (float x, float y, String d, color paint, String state, float size) {
  pushMatrix();
  translate(x, y);
  scale(size, size); //5
  if (state == "izike") {
    fill(izike_color);
    stroke(izike_color);
  } else if (state == "izike2") {
    fill(255);
    stroke(255);
  } else {
    fill(paint);
    stroke(paint);
  }
  strokeWeight(1.09);
  strokeCap(PROJECT);
  line(0.5, 7, 0.5, 14);
  line(1.5, 4, 1.5, 13);
  line(2.5, 3, 2.5, 12);
  line(3.5, 2, 3.5, 13);
  line(4.5, 2, 4.5, 14);
  line(5.5, 1, 5.5, 14);
  line(6.5, 1, 6.5, 12);
  line(7.5, 1, 7.5, 12);
  line(8.5, 1, 8.5, 14);
  line(9.5, 2, 9.5, 14);
  line(10.5, 2, 10.5, 13);
  line(11.5, 3, 11.5, 12);
  line(12.5, 4, 12.5, 13);
  line(13.5, 7, 13.5, 14);

  if (state == "izike") {
    fill(255);
    stroke(255);
    rect(4.5, 6, 1, 1);
    rect(8.5, 6, 1, 1);
    point(1.5, 11);
    line(2.5, 10, 3.5, 10);
    line(4.5, 11, 5.5, 11);
    line(6.5, 10, 7.5, 10);
    line(8.5, 11, 9.5, 11);
    line(10.5, 10, 11.5, 10);
    point(12.5, 11);
  } else if (state == "izike2") {
    fill(255, 0, 0);
    stroke(255, 0, 0);
    rect(4.5, 6, 1, 1);
    rect(8.5, 6, 1, 1);
    point(1.5, 11);
    line(2.5, 10, 3.5, 10);
    line(4.5, 11, 5.5, 11);
    line(6.5, 10, 7.5, 10);
    line(8.5, 11, 9.5, 11);
    line(10.5, 10, 11.5, 10);
    point(12.5, 11);
  } else if (d == "LEFT") {
    fill(255);
    stroke(255);
    rect(2.5, 4, 1, 4);
    rect(1.5, 5, 3, 2);
    fill(0, 0, 255);
    stroke(0, 0, 255);
    strokeWeight(1.06);
    rect(1.5, 6, 1, 1);
    strokeWeight(1.03);
    fill(255);
    stroke(255);
    rect(8.5, 4, 1, 4);
    rect(7.5, 5, 3, 2);
    fill(0, 0, 255);
    stroke(0, 0, 255);
    strokeWeight(1.06);
    rect(7.5, 6, 1, 1);
  } else if (d == "RIGHT") {
    fill(255);
    stroke(255);
    rect(4.5, 4, 1, 4);
    rect(3.5, 5, 3, 2);
    fill(0, 0, 255);
    stroke(0, 0, 255);
    strokeWeight(1.06);
    rect(5.5, 6, 1, 1);
    strokeWeight(1.03);
    fill(255);
    stroke(255);
    rect(10.5, 4, 1, 4);
    rect(9.5, 5, 3, 2);
    fill(0, 0, 255);
    stroke(0, 0, 255);
    strokeWeight(1.06);
    rect(11.5, 6, 1, 1);
  } else if (d == "UP") {
    fill(255);
    stroke(255);
    rect(3.5, 4, 1, 4);
    rect(2.5, 5, 3, 2);
    fill(0, 0, 255);
    stroke(0, 0, 255);
    strokeWeight(1.06);
    rect(3.5, 4, 1, 1);
    strokeWeight(1.03);
    fill(255);
    stroke(255);
    rect(9.5, 4, 1, 4);
    rect(8.5, 5, 3, 2);
    fill(0, 0, 255);
    stroke(0, 0, 255);
    strokeWeight(1.06);
    rect(9.5, 4, 1, 1);
  } else if (d == "DOWN") {
    fill(255);
    stroke(255);
    rect(3.5, 4, 1, 4);
    rect(2.5, 5, 3, 2);
    fill(0, 0, 255);
    stroke(0, 0, 255);
    strokeWeight(1.06);
    rect(3.5, 7, 1, 1);
    strokeWeight(1.03);
    fill(255);
    stroke(255);
    rect(9.5, 4, 1, 4);
    rect(8.5, 5, 3, 2);
    fill(0, 0, 255);
    stroke(0, 0, 255);
    strokeWeight(1.06);
    rect(9.5, 7, 1, 1);
  }
  popMatrix();
}