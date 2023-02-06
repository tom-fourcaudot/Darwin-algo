// Phrase approach genetics algorithm
// Inspired by the coding train -> https://www.youtube.com/watch?v=-jv3CgDN9sc&ab_channel=TheCodingTrain
Population p;

// The sentence you want to reached
final String target = "Genetics algorithms are amazing !!!";
// The size of the population (try at least 50)
final int popSize = 500;
// The mutation rate of each DNA
final float mutationRate = 0.01;

void setup() {
  size(1000, 500);
  background(0);
  p = new Population(target, popSize, mutationRate);
}

void draw() {
    background(0);
    p.calcFitness();
    boolean reached  = p.isFinished();
    p.drawInfo(reached);
    if (!reached) {
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
