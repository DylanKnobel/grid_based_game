float x;
float time;
float accumulator;

void setup() {
  size(800, 800);
  time = 0;
  accumulator = 0;
}

void draw() {
  background(0);
  
  fill(255);
  x = noise(time);
  x = map(x, 0, 1, 0, 20);
  accumulator += x;
  time += 0.01;
  
  ellipse(accumulator, height/2, 100, 100);
}