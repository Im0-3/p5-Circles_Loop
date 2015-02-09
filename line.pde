GifRecorder recorder = new GifRecorder(this, 60, 2);
float center_x;
float center_y;
ArrayList<Node> node = new ArrayList<Node>();
int node_count = 0;
int timer = 0;
String type;

void setup() {
  size(400, 400);
  background(50);
  colorMode(HSB);
  center_x = width / 2;
  center_y = height / 2;
  node.add(new Node());
  node.add(new Node());
  node.add(new Node());
  node.add(new Node());
  node.add(new Node());
}

void draw() {
  recorder.onDraw(); //<>//
  background(0);
  for(int i = 0; i < 5; i++){
    if(node.get(i) instanceof Node){
      node.get(i).draw();
      node.get(i).move();
    }
  }
  
  if(timer > 30){
    node.remove(0);
    node.add(new Node());
    timer = -1;
  }
  timer++;
}

void mouseClicked() {
  recorder.recordForSeconds("out.gif", 3);
}

void keyPressed() {
  if (keyCode == 32) {
    recorder.recordFrames("out.gif", 100); 
  }
} //<>//

class Node{
  float angle;
  float radian;
  float rr;
  float r;
  float[] point_x = new float[5];
  float[] point_y = new float[5];
  float count;
  int h;
  int s;
  int b;
  int a;
  
  Node(){
    angle = 0;
    radian = 0;
    r = 0.1;
    rr = 0.1;
    count = (random(0,0.9) * random(0,0.9) / 2) * 2 * 2 * 2 * 2 * 2 * 2 * 2 * 2 * 2;
    h = floor(random(255));
    s = 0;
    b = 255;
    a = 150;
  }
  
  void draw(){
    strokeWeight(4);
    for(int i = 0; i < 360 * 2; i++){
      radian = radians(angle) + rr;
      stroke(h, s, b, a + (i/8));
      point_x[1] = (r * cos(radian)) + center_x;
      point_y[1] = (r * sin(radian)) + center_y;
      point_x[2] = (r * cos(radian * count)) + point_x[1];
      point_y[2] = (r * sin(radian * count)) + point_y[1];
      point_x[3] = (r * cos(radian * count)) + point_x[2];
      point_y[3] = (r * sin(radian * count)) + point_y[2];
      point_x[4] = (r * cos(radian * count)) + point_x[3];
      point_y[4] = (r * sin(radian * count)) + point_y[3];
      point(point_x[4], point_y[4]);
      angle += 0.5;
    }
  }
  
  void move(){
    r += (r * 0.05);
    rr += (rr * 0.01);
  }
}
