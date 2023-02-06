// Phrase approach genetics algorithm
Population p;
final String target = "This a not a big test, are you sure ?";
final int popSize = 500;
final float mutationRate = 0.01;

void setup() {
  size(1000, 500);
  background(0);
  p = new Population(target, popSize, mutationRate);
}

void draw() {
    background(0);
    p.calcFitness();
    p.drawInfo();
    if (!p.isFinished()) {
      p.naturalSelection();
      p.generate();
    } else {
      textSize(20);
      stroke(0, 255, 0);
      textAlign(CENTER, BOTTOM);
      text("Target reached", width/2, 3*(height/4));
      stroke(255);
      textAlign(CENTER, TOP);
      text("Target reached in "+p.nbGeneration+" generations", width/2, 3*(height/4));
      noLoop();
    }
}
