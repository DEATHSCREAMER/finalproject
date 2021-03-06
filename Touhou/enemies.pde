//enemies should include:
//7UP,Sinkist,,
abstract class enemy extends thing implements damageable{
  int id;
  PImage me;
  float health;
  float startX;
  enemy(float x, float y, float health, float startX){
    this.x = x;
    this.y = y;
    this.health = health;
    this.startX = startX;
  }
  abstract void move();
  abstract void moveD(float velox, float veloy);
  int getID() {return id;}
  
  
  float getHealth(){return health;}
  float getStartX(){return startX;}
  abstract void show();
  void getHurt(){
    health -= 1;
  }
}

abstract class boss extends thing implements damageable{
  PImage me;
  float health;
  float startX;
  boss(float x, float y, float health, float startX){
    this.x = x;
    this.y = y;
    this.health = health;
    this.startX = startX;
  }
  abstract void rotate1();
   abstract void moveD(float velox, float veloy);
  abstract void move();
  abstract float[] getHitbox();
  
  float getHealth(){return health;}
  float getStartX(){return startX;}
  abstract void show();
  void getHurt(){
    health -= 1;
  }
  abstract void moveDown(int velocity);
}

class sevenUp extends enemy{
  PImage me = loadImage("sevenUp.png");
  float velocity;
  
  
  sevenUp(float x, float y, float health, float velocity, float startX, int idx){
    super(x,y,health,startX);
    this.velocity = velocity;
    hitbox = new float[]{20,40};
    id = idx;
  }  
  
  float[] getHitbox() {return hitbox;}
  
  void moveD(float velox, float veloy) {
    x += velox;
    y += veloy;
  }
  
  void show(){image(me,x-10,y-20,20,40);}
  
  
  
  
  /*
  void move(){
    //move in a circle
    String rad = ("" + (-(Math.min(x,width-x)*Math.min(x,width-x)) + 200*200));
    double uRad = Double.parseDouble(rad);
    double root = Math.sqrt(uRad);
    y = (float)root;
    
    x -= velocity;
    //print("(",x,",",y,") ");
  }
  */
  
  void move(){
    y -= velocity;
  }
}

class cola extends boss{
  PImage me = loadImage("cola.png");
  float velocity;
  float negBoundary;
  float posBoundary;
  float deg = .1;
  
  cola(float x, float y, float health, float startX, float velocity, float negBoundary, float posBoundary){
    super(x,y,health,startX);
    hitbox = new float[]{60,80};
    this.velocity = velocity;
    this.negBoundary = negBoundary;
    this.posBoundary = posBoundary;
  }
  float[] getHitbox() {return hitbox;}
  void moveD(float velox, float veloy) {
    x += velox;
    y += veloy;
  }
  void show(){
    /*
  pushMatrix();
  translate(x,y);
  rotate(radians(deg));
  */
  image(me,x-20,y-40,60,80);
  //popMatrix();
  if (deg < 360)
    deg+=.1;
   else
     deg = .1;
  }
  void move(){
    x += velocity;
    if (x >= width - 50 || x <= 50){
      velocity = -velocity;
    }
  }
  
  void rotate1() {
    pushMatrix();
    rotate(5);
    popMatrix();
  }
  
  void moveDown(int velocity) {
    y += velocity;
  }
}
